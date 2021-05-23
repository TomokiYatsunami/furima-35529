class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :price, :status, :ship_price, :ship_date, :category, :prefecture).merge(user_id: current_user.id)
  end
end
