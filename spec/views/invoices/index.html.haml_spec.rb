require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :emitter_rfc => "Emitter Rfc",
        :receiver_rfc => "Receiver Rfc",
        :fiscal_id => "Fiscal",
        :amount_cents => 2,
        :amount_currency => "Amount Currency"
      ),
      Invoice.create!(
        :emitter_rfc => "Emitter Rfc",
        :receiver_rfc => "Receiver Rfc",
        :fiscal_id => "Fiscal",
        :amount_cents => 2,
        :amount_currency => "Amount Currency"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => "Emitter Rfc".to_s, :count => 2
    assert_select "tr>td", :text => "Receiver Rfc".to_s, :count => 2
    assert_select "tr>td", :text => "Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Amount Currency".to_s, :count => 2
  end
end
