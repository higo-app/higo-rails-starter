require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :emitter_rfc => "MyString",
      :receiver_rfc => "MyString",
      :fiscal_id => "MyString",
      :amount_cents => 1,
      :amount_currency => "MyString"
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input[name=?]", "invoice[emitter_rfc]"

      assert_select "input[name=?]", "invoice[receiver_rfc]"

      assert_select "input[name=?]", "invoice[fiscal_id]"

      assert_select "input[name=?]", "invoice[amount_cents]"

      assert_select "input[name=?]", "invoice[amount_currency]"
    end
  end
end
