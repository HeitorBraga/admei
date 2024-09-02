require 'rails_helper'

RSpec.describe "cash_registers/show", type: :view do
  before(:each) do
    @cash_register = assign(:cash_register, CashRegister.create!(
      :amount => 2.5,
      :payment_method => nil,
      :month => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
  end
end
