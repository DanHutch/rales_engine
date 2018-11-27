FactoryBot.define do
  factory :item do
    name { "FakeItem" }
    description { "This is a fake description of a fake item" }
    unit_price { 1 }
    merchant 
  end
end
