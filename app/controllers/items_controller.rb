class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.all.order(id: "DESC")
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

  def show
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :price, :status_id, :ship_price_id, :ship_date_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
