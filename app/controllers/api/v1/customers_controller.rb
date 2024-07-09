class Api::V1::CustomersController < ApplicationController

  before_action :set_customer, only: %i[update destroy show]

  def index    
    @customers = Customer.all
    render json: @customers, each_serializer: CustomersSerializer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer
    else
      render json: { error: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    render json: @customer
  end  

  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: { error: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      render json: { message: 'customer destroyed successfully' },
             status: :ok
    else
      render json: { error: 'something went wrong' },
             status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :city, :state, :phone_number, :gst, :state_code)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end