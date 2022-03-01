require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :receiver_clabe => "Receiver Account Number",
        :sender_clabe => "Sender Account Number",
        :invoice_fiscal_id => "Invoice Fiscal",
        :amount_cents => 2,
        :amount_currency => "Amount Currency"
      ),
      Payment.create!(
        :receiver_clabe => "Receiver Account Number",
        :sender_clabe => "Sender Account Number",
        :invoice_fiscal_id => "Invoice Fiscal",
        :amount_cents => 2,
        :amount_currency => "Amount Currency"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => "Receiver Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Sender Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Invoice Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Amount Currency".to_s, :count => 2
  end
end
