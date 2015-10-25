class ProductsController < ApplicationController
  before_action :find_product, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
