# frozen_string_literal: true

class Item < ApplicationRecord
  TAX_RATE = 2
  validates :name, presence: true
  validates :price, presence: true

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  enum :category, { coffee: 0, dessert: 1, drinks: 2, bites: 3, combo: 4 }

  def tax_price
    price > 35 ? self.price += tax_amount : self.price
  end

  def tax_amount
    self.price * TAX_RATE / 100
  end
end
