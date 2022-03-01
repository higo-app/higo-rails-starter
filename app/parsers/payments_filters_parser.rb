class PaymentsFiltersParser < BaseFiltersParser
  def array_filter_keys
    %i[sender_clabe receiver_clabe invoice_fiscal_id]
  end

  def integer_range_filter_keys
    %i[amount_cents]
  end

  def date_range_filter_keys
    %i[sent_at]
  end
end
