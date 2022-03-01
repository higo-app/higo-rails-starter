require 'securerandom'

namespace :samples do
  task create: :environment do
    ActiveRecord::Base.transaction do
      user1 = User.create!(
        email: 'user1@example.com',
        password: 'password',
        rfc: SecureRandom.hex(12),
        clabe: SecureRandom.hex(12)
      )

      received_invoices = 20.times.map do
        emitted_at = (0..180).to_a.sample.days.ago

        user1.invoices.create! \
          fiscal_id: SecureRandom.hex(12),
          amount_cents: (1000_00..10_000_00).to_a.sample,
          receiver_rfc: user1.rfc,
          emitter_rfc: SecureRandom.hex(12),
          emitted_at: emitted_at,
          expired_at: emitted_at + [30, 60, 90].sample.days
      end

      emitted_invoices = 20.times.map do
        emitted_at = (0..180).to_a.sample.days.ago

        user1.invoices.create! \
          fiscal_id: SecureRandom.hex(12),
          amount_cents: (1000_00..10_000_00).to_a.sample,
          receiver_rfc: SecureRandom.hex(12),
          emitter_rfc: user1.rfc,
          emitted_at: emitted_at,
          expired_at: emitted_at + [30, 60, 90].sample.days
      end

      sent_payments = received_invoices.sample(10).map do |invoice|
        amount_cents = (100_00..invoice.amount_cents).to_a.sample

        user1.payments.create! \
          invoice_fiscal_id: invoice.fiscal_id,
          amount_cents: (([invoice.amount_cents] * 3) + [amount_cents]).sample,
          sender_clabe: user1.clabe,
          receiver_clabe: SecureRandom.hex(12),
          sent_at: invoice.emitted_at + (0..180).to_a.sample.days
      end

      received_payments = emitted_invoices.sample(10).map do |invoice|
        amount_cents = (100_00..invoice.amount_cents).to_a.sample

        user1.payments.create! \
          invoice_fiscal_id: invoice.fiscal_id,
          amount_cents: (([invoice.amount_cents] * 3) + [amount_cents]).sample,
          sender_clabe: user1.clabe,
          receiver_clabe: SecureRandom.hex(12),
          sent_at: invoice.emitted_at + (0..180).to_a.sample.days
      end
    end
  end
end
