class Customer < ApplicationRecord
	has_many :invoices

	def invoice_ids
		invoices.pluck(:id)
	end

end
