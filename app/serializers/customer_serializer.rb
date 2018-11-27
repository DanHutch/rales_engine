class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :invoice_ids

end
