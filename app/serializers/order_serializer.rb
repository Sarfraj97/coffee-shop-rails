class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :status
  has_many :order_items, each_serializer: OrderItemSerializer
  has_many :products, through: :order_items, each_serializer: ProductSerializer

  def total_price
    object.total_price.to_i
  end
end
