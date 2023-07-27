class Api::V1::TransactionsController < ApplicationController
  before_action :set_customer, only: %i[create]

  def index
  end

  def create
    @transaction = @customer.transactions.new(allowed_params)
    if @transaction.save
      render json: @transaction
    end
  end

  private

  def allowed_params
    params.require(:transaction).permit(:amount_type,:amount)
  end 

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
