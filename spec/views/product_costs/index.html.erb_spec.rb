require 'rails_helper'

RSpec.describe "product_costs/index", type: :view do
  before(:each) do
    assign(:product_costs, [
      ProductCost.create!(
        :product => nil,
        :cost => 2.5
      ),
      ProductCost.create!(
        :product => nil,
        :cost => 2.5
      )
    ])
  end

  it "renders a list of product_costs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
