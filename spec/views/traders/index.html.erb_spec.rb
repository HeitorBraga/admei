require 'rails_helper'

RSpec.describe "traders/index", type: :view do
  before(:each) do
    @traders = create_list(:trader, 5)
    assign(:traders, Trader.all.paginate(page: 1))
  end

  it "renders a list of traders" do
    render

    @traders.each do |trader|
      assert_select "tr>td", text: trader.name
      assert_select "tr>td", text: trader.federal_tax_id
      assert_select "tr>td", text: trader.phone
      assert_select "tr>td", text: trader.mobile
      assert_select "tr>td", text: trader.email
    end
  end
end
