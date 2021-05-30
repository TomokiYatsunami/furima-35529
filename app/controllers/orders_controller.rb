class OrdersController < ApplicationController

  def index
    @ship_record = ShipRecord.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
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
    Payjp.api_key = "sk_test_ebc69ffbb802614481a30c7c"
    Payjp::Charge.create(
      amount: @product.price,
      card: ship_record_params[:token],
      currency: 'jpy'
    )
  end

end
