FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { "1234567890123456" }
    credit_card_expiration_date { "fakedate" }
    result { "fakeresult" }
  end
end
