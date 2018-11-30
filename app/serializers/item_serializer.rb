class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id

  attributes :unit_price do |object|
    '%.2f' % (object.unit_price / 100.00)
  end
end
