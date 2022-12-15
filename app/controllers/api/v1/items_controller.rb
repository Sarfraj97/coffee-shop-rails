class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: %i[update destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: { error: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: { error: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      render json: { message: 'Item destroyed successfully' },
             status: :ok
    else
      render json: { error: 'something went wrong' },
             status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
