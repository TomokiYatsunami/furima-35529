class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @ship_record = ShipRecord.new
  end

  def create
    @ship_record = ShipRecord.new(ship_record_params)
    if @ship_record.valid?
      pay_item
      @ship_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def ship_record_params
    params.require(:ship_record).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: ship_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user == @product.user || @product.record.present?
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
