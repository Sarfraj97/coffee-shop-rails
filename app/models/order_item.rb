# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  after_create :quantity_update

  def quantity_update
    item.update(quantity: item.quantity - self.quantity)
  end
end
