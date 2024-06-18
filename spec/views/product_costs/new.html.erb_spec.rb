require 'rails_helper'

RSpec.describe "product_costs/new", type: :view do
  before(:each) do
    assign(:product_cost, ProductCost.new(
      :product => nil,
      :cost => 1.5
    ))
  end

  it "renders new product_cost form" do
    render

    assert_select "form[action=?][method=?]", product_costs_path, "post" do

      assert_select "input[name=?]", "product_cost[product_id]"

      assert_select "input[name=?]", "product_cost[cost]"
    end
  end
end
