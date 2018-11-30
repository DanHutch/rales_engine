class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity 
  
  attributes :unit_price do |object|
    '%.2f' % (object.unit_price / 100.00)
  end
end
