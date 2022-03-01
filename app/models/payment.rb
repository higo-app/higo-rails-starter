class Payment < ApplicationRecord
  attribute :amount_currency, default: 'MXN'
end
