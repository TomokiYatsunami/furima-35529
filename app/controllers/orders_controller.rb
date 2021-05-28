class OrdersController < ApplicationController

  def index
    @ship_record = ShipRecoed.index
  end

  def create
    @ship_record = ShipRecoed.index(record_params)
    if @ship_record.valid?
      @ship_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:ship_record).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id, :record_id, :user_id, :product_id).merge(user_id: current_user.id)
  end

end
