class Customer < ApplicationRecord
	has_many :invoices


	def self.fav_merchant(id)
		Merchant.unscoped.select('merchants.*, COUNT(transactions.id) AS merchant_transactions').joins(invoices: [:transactions]).where(invoices: {customer_id: id}).merge(Transaction.unscoped.successful).group(:id).order('merchant_transactions DESC').limit(1).first
	end

	def self.transaction_list(cust_id)
    Transaction.select('transactions.*').joins(:invoice).where(invoices: {customer_id: cust_id})
  end

end
