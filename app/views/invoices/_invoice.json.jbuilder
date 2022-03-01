json.extract! invoice, :id, :emitter_rfc, :receiver_rfc, :fiscal_id, :amount_cents, :amount_currency, :emitted_at, :expired_at, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
