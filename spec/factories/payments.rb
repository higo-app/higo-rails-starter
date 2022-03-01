FactoryBot.define do
  factory :payment do
    receiver_clabe { "MyString" }
    sender_clabe { "MyString" }
    invoice_fiscal_id { "MyString" }
    amount_cents { 1 }
    amount_currency { "MyString" }
  end
end
