class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, class_name: 'Variant', foreign_key: 'product_id' 
  validates :quantity, presence: true
  after_create :quantity_update

  def quantity_update
    # product.update(quantity: product.quantity - quantity)
  end
end
