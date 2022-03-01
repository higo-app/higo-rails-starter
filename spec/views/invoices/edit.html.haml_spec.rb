require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :emitter_rfc => "MyString",
      :receiver_rfc => "MyString",
      :fiscal_id => "MyString",
      :amount_cents => 1,
      :amount_currency => "MyString"
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[emitter_rfc]"

      assert_select "input[name=?]", "invoice[receiver_rfc]"

      assert_select "input[name=?]", "invoice[fiscal_id]"

      assert_select "input[name=?]", "invoice[amount_cents]"

      assert_select "input[name=?]", "invoice[amount_currency]"
    end
  end
end
