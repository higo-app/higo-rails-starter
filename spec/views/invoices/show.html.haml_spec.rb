require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :emitter_rfc => "Emitter Rfc",
      :receiver_rfc => "Receiver Rfc",
      :fiscal_id => "Fiscal",
      :amount_cents => 2,
      :amount_currency => "Amount Currency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Emitter Rfc/)
    expect(rendered).to match(/Receiver Rfc/)
    expect(rendered).to match(/Fiscal/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Amount Currency/)
  end
end
