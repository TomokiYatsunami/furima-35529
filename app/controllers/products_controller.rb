class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top_page,  only: [:edit, :update, :destroy]

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
      render new_product_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :price, :status_id, :ship_price_id, :ship_date_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def move_to_top_page
    unless current_user == @product.user
      redirect_to root_path 
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
