class Product < ApplicationRecord
  extend Enumerize

  has_many :reminders, as: :remindable
  # after_update :create_reminder
  TAX_RATE = 2

  validates :name, presence: true


  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :variants
  belongs_to :category

  # def create_reminder
  #   if quantity < 5
  #     reminders.create(title: "Your Item will be out of stock soon.", status:0)
  #   end
  # end

end
