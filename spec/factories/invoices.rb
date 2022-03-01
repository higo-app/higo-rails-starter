FactoryBot.define do
  factory :invoice do
    emitter_rfc { "MyString" }
    receiver_rfc { "MyString" }
    fiscal_id { "MyString" }
    amount_cents { 1 }
    amount_currency { "MyString" }
    emitted_at { "2022-03-01 12:35:06" }
    expired_at { "2022-03-01 12:35:06" }
  end
end
