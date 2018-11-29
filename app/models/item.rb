class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.most_sold(num)
    Item.unscoped.joins(invoices: [:transactions]).select("items.*, SUM(invoice_items.quantity) AS number_sold").merge(Transaction.unscoped.successful).group(:id).order('number_sold DESC').limit(num)
          
  end
end
