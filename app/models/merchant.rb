class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	

	def self.revenue_by_date(x)
		Invoice.unscoped.select("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").joins(:invoice_items, :transactions).merge(Transaction.unscoped.successful).group("invoice_items.id").where("cast(invoices.created_at AS text) Like ?", "#{x}%").pluck("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue").sum
  end
end
