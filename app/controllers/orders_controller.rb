class OrdersController < ApplicationController

  def index
    @ship_record = ShipRecord.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @ship_record = ShipRecord.new(ship_record_params)
    if @ship_record.valid?
      @ship_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def ship_record_params
    params.require(:ship_record).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
