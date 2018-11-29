class Customer < ApplicationRecord
	has_many :invoices


	def fav_merchant
		binding.pry
		invoices.joins(:transactions)
						.select('transactions.*')
		# .joins(:merchant)
		# .select('merchants.*')
	end

end
