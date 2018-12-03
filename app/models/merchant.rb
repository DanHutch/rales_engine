class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	

	def self.revenue_by_date(x)
		Invoice.unscoped.joins(:invoice_items, :transactions).merge(Transaction.unscoped.successful).where("cast(invoices.created_at AS text) Like ?", "#{x}%").sum("invoice_items.quantity*invoice_items.unit_price")
	end

	def self.most_revenue(num)
		Merchant.unscoped.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.successful).group(:id).order('revenue DESC').limit(num)
	end

	def self.top_sellers(num)
		Merchant.unscoped.select('merchants.*, SUM(invoice_items.quantity) AS items_sold').joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.successful).group(:id).order('items_sold DESC').limit(num)
	end

	def self.revenue(id)
		Merchant.unscoped.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').joins(invoices: [:invoice_items, :transactions]).where(id: id).merge(Transaction.unscoped.successful).group(:id).first.revenue
	end

	def self.single_revenue_by_date(id, date)
		Invoice.unscoped.joins(:invoice_items, :transactions).where('invoices.merchant_id = ?', id).merge(Transaction.unscoped.successful).where("cast(invoices.created_at AS text) Like ?", "#{date}%").sum("invoice_items.quantity*invoice_items.unit_price")
	end

	def self.fav_customer(id)
		Customer.unscoped.select('customers.*, COUNT(transactions) AS sales').joins(invoices: [:transactions]).where('invoices.merchant_id = ?', id).merge(Transaction.unscoped.successful).group(:id).order('sales DESC').limit(1).first
	end

	# def self.pending(id)
	# 	Customer.find_by_sql(["SELECT customers.* FROM customers INNER JOIN invoices ON invoices.customer_id = customers.id INNER JOIN transactions ON transactions.invoice_id = invoices.id WHERE invoices.merchant_id = ? ORDER BY customers.id ASC EXCEPT SELECT customers.* FROM customers INNER JOIN invoices ON invoices.customer_id = customers.id INNER JOIN transactions ON transactions.invoice_id = invoices.id WHERE transactions.result = success WHERE invoices.merchant_id = ?", 17, 17])

		# .select('customers.*').joins(invoices: [:transactions]).where('invoices.merchant_id = ?', id).
		
		# .where.not('transactions.result = ?', "success")
	# end
	
end
