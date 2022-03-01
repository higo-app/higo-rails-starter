class Invoice < ApplicationRecord
  attribute :amount_currency, default: 'MXN'
end
