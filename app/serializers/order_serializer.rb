# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :status, :phone_number
  has_many :order_items, each_serializer: OrderItemSerializer
  has_many :items, through: :order_items, each_serializer: ItemSerializer

  def total_price
    object.total_price.to_i
  end
end
