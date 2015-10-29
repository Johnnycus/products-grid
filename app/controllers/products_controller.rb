class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  before_action :auth_user!, except: [:index, :show]

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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :is_pro)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
