class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[show update]
  before_action :set_customer, only: %i[create]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = @customer.orders.new(order_params)
  
    if params[:product_ids].present?
      params[:product_ids].each do |param|
        @order.order_items.build(product_id: param[:id], quantity: param[:quantity])
      end
  
      if @order.save
        render json: @order
      else
        render json: { error: @order.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { error: 'Product IDs are missing' }, status: :unprocessable_entity
    end
  end
  
  def update
    if @order.update(order_params)
      @order.add_item(params[:product_ids]) if params[:product_ids].present?
      render json: @order
    else
      render json: { error: @order.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      render json: { message: 'Order Cancelled successfully' },
              status: :ok
    else
      render json: { error: 'something went wrong' },
              status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
