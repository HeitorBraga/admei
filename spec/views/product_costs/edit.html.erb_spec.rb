require 'rails_helper'

RSpec.describe "product_costs/edit", type: :view do
  before(:each) do
    @product_cost = assign(:product_cost, ProductCost.create!(
      :product => nil,
      :cost => 1.5
    ))
  end

  it "renders the edit product_cost form" do
    render

    assert_select "form[action=?][method=?]", product_cost_path(@product_cost), "post" do

      assert_select "input[name=?]", "product_cost[product_id]"

      assert_select "input[name=?]", "product_cost[cost]"
    end
  end
end
