class InvoicesFiltersParser < BaseFiltersParser
  def array_filter_keys
    %i[emitter_rfc receiver_rfc fiscal_id]
  end

  def integer_range_filter_keys
    %i[amount_cents]
  end

  def date_range_filter_keys
    %i[emitted_at expired_at]
  end
end
