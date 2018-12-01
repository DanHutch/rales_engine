class InvoiceDateSerializer
  include FastJsonapi::ObjectSerializer

  attributes :best_day do |object|
    object.created_at
  end
end
