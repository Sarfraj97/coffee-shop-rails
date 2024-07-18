class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy]

  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: { error: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: { error: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: { message: 'Product destroyed successfully' },
             status: :ok
    else
      render json: { error: 'something went wrong' },
             status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id, :quantity, :volume, :volume_type)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
