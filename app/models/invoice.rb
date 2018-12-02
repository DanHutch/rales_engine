class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.item_list(inv_id)
    Item.select('items.*').joins(:invoice_items).where(invoice_items: {invoice_id: inv_id})
  end
end
