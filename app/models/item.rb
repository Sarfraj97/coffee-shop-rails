# frozen_string_literal: true

class Item < ApplicationRecord
  TAX_RATE = 2
  validates :name, presence: true
  validates :price, presence: true
  validates :volume_type, presence: true

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  def tax_price
    self.price
  end

  def tax_amount
    self.price * TAX_RATE / 100
  end

  enum volume_type: {
    kg: 0,
    ltr: 1,
    ml: 2
  }

end
