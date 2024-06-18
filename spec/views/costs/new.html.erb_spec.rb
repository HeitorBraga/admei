require 'rails_helper'

RSpec.describe "costs/new", type: :view do
  before(:each) do
    assign(:cost, Cost.new(
      :ingredient => "MyString",
      :unit => 1,
      :quantity => 1,
      :price => 1.5,
      :quantity_used => 1,
      :cost => 1.5
    ))
  end

  it "renders new cost form" do
    render

    assert_select "form[action=?][method=?]", costs_path, "post" do

      assert_select "input[name=?]", "cost[ingredient]"

      assert_select "input[name=?]", "cost[unit]"

      assert_select "input[name=?]", "cost[quantity]"

      assert_select "input[name=?]", "cost[price]"

      assert_select "input[name=?]", "cost[quantity_used]"

      assert_select "input[name=?]", "cost[cost]"
    end
  end
end
