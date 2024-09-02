require 'rails_helper'

RSpec.describe "cash_registers/edit", type: :view do
  before(:each) do
    @cash_register = assign(:cash_register, CashRegister.create!(
      :amount => 1.5,
      :payment_method => nil,
      :month => 1
    ))
  end

  it "renders the edit cash_register form" do
    render

    assert_select "form[action=?][method=?]", cash_register_path(@cash_register), "post" do

      assert_select "input[name=?]", "cash_register[amount]"

      assert_select "input[name=?]", "cash_register[payment_method_id]"

      assert_select "input[name=?]", "cash_register[month]"
    end
  end
end
