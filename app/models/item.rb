# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize

  enumerize :volume_type, in: { kg: 0, ltr: 1, ml: 2 }, predicates: true

  validates :volume_type, presence: true
  has_many :reminders, as: :remindable
  after_update :create_reminder
  TAX_RATE = 2

  validates :name, presence: true
  validates :price, presence: true


  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  belongs_to :category

  def create_reminder
    if quantity < 5
      reminders.create(title: "Your Item will be out of stock soon.", status:0)
    end
  end
  
  def tax_price
    self.price
  end

  def tax_amount
    self.price * TAX_RATE / 100
  end

end
