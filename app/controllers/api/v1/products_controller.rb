class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  before_action :check_login, only: %i[create]

  def index
    render json: Product.all
  end

  def create
    product = current_user.products.build(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { erros: product.errors}, status: :unprocessable_entity
    end
  end

  def show
    render json: @product
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end
end
