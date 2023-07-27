class Transaction < ApplicationRecord
	extend Enumerize
	belongs_to :customer

	enumerize :amount_type, in: { credit: 0, debit: 1}, predicates: true
	validates :amount_type, presence: true
	after_save :calculate

	def calculate
		if customer && customer.total_amount && amount
			case amount_type
			when "credit"
				new_total_amount = customer.total_amount + amount
			when "debit"
				new_total_amount = customer.total_amount - amount
			end
		end

		customer.transaction do
			customer.update(total_amount: new_total_amount)
		end
	end
end
