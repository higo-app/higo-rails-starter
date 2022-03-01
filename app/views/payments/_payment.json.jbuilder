json.extract! payment, :id, :receiver_clabe, :sender_clabe, :invoice_fiscal_id, :amount_cents, :amount_currency, :sent_at, :created_at, :updated_at
json.url payment_url(payment, format: :json)
