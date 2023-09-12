# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  has_many :reminders, as: :remindable
  after_save :create_transaction

  enum :status, { due: 0, paid: 1 }, default: 0

  validates :phone_number, presence: true

  def add_item(item_ids)
    item_ids.each do |item_id|
      if (order_item = order_items.find_by_item_id(item_id))
        order_item.quantity += 1
        order_item.save
        order_item
      else
        order_items.create(item_id: item_id)
      end
    end
    calculate_total_price
  end

  def calculate_total_price
    total_price = 0
    order_items.each do |order_item|
      total_price += order_item.quantity * order_item.item.price
    end
    update(total_price: total_price)
  end

  def create_transaction
    customer.account.transactions.create!(transaction_type: status, transaction_amount: total_price,account_id:  customer.account.id)
  end

end
