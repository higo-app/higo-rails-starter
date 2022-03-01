require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :receiver_clabe => "MyString",
      :sender_clabe => "MyString",
      :invoice_fiscal_id => "MyString",
      :amount_cents => 1,
      :amount_currency => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input[name=?]", "payment[receiver_clabe]"

      assert_select "input[name=?]", "payment[sender_clabe]"

      assert_select "input[name=?]", "payment[invoice_fiscal_id]"

      assert_select "input[name=?]", "payment[amount_cents]"

      assert_select "input[name=?]", "payment[amount_currency]"
    end
  end
end
