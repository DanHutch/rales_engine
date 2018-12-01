class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	

	def self.revenue_by_date(x)
		Invoice.unscoped.select("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").joins(:invoice_items, :transactions).merge(Transaction.unscoped.successful).group("invoice_items.id").where("cast(invoices.created_at AS text) Like ?", "#{x}%").pluck("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").sum
	end

	def self.most_revenue(num)
		Merchant.unscoped.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.successful).group(:id).order('revenue DESC').limit(num)
	end

	def self.top_sellers(num)
		Merchant.unscoped.select('merchants.*, SUM(invoice_items.quantity) AS items_sold').joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.successful).group(:id).order('items_sold DESC').limit(num)
	end
	
end
