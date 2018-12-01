class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.most_sold(num)
    Item.unscoped.joins(invoices: [:transactions]).select("items.*, SUM(invoice_items.quantity) AS number_sold").merge(Transaction.unscoped.successful).group(:id).order('number_sold DESC').limit(num)     
  end

  def self.most_revenue(num)
    Item.unscoped.joins(invoices: [:transactions]).select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").merge(Transaction.unscoped.successful).group(:id).order('revenue DESC').limit(num)       
  end

  def self.item_best_day(id)
    Invoice.unscoped.select("invoices.created_at, sum(invoice_items.quantity) AS units").joins(:invoice_items, :transactions).where("invoice_items.item_id = ?", "#{id}").merge(Transaction.unscoped.successful).group("invoices.created_at").order("units desc, invoices.created_at desc").limit(1).first.created_at
  end

end
