# frozen_string_literal: true
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
    if @order.save
      @order.add_item(params[:item_ids]) if params[:item_ids].present?
      render json: @order
    else
      render json: { error: @order.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      @order.add_item(params[:item_ids]) if params[:item_ids].present?
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
    params.require(:order).permit(:total_price, :status, :phone_number)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
