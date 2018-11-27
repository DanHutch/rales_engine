FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status { "Fake Status" }
  end
end
