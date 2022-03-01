require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :receiver_clabe => "Receiver Account Number",
      :sender_clabe => "Sender Account Number",
      :invoice_fiscal_id => "Invoice Fiscal",
      :amount_cents => 2,
      :amount_currency => "Amount Currency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Receiver Account Number/)
    expect(rendered).to match(/Sender Account Number/)
    expect(rendered).to match(/Invoice Fiscal/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Amount Currency/)
  end
end
