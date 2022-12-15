# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  validates_presence_of :order_items
  has_many :items, through: :order_items

  enum :status, { in_progress: 0, completed: 1, paid: 2 }, default: 0

  after_save :send_cofirmation_sms

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
      total_price += order_item.quantity * order_item.item.tax_price
    end
    update(total_price: total_price)
  end

  def send_cofirmation_sms
    return unless status == 'paid'
    SendMessageJob.set(wait: 30.seconds).perform_later(phone_number)
  end
end
