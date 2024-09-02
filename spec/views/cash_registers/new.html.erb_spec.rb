require 'rails_helper'

RSpec.describe "cash_registers/new", type: :view do
  before(:each) do
    assign(:cash_register, CashRegister.new(
      :amount => 1.5,
      :payment_method => nil,
      :month => 1
    ))
  end

  it "renders new cash_register form" do
    render

    assert_select "form[action=?][method=?]", cash_registers_path, "post" do

      assert_select "input[name=?]", "cash_register[amount]"

      assert_select "input[name=?]", "cash_register[payment_method_id]"

      assert_select "input[name=?]", "cash_register[month]"
    end
  end
end
