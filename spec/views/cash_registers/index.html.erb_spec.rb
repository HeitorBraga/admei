require 'rails_helper'

RSpec.describe "cash_registers/index", type: :view do
  before(:each) do
    assign(:cash_registers, [
      CashRegister.create!(
        :amount => 2.5,
        :payment_method => nil,
        :month => 3
      ),
      CashRegister.create!(
        :amount => 2.5,
        :payment_method => nil,
        :month => 3
      )
    ])
  end

  it "renders a list of cash_registers" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
