require 'rails_helper'

RSpec.describe "costs/edit", type: :view do
  before(:each) do
    @cost = assign(:cost, Cost.create!(
      :ingredient => "MyString",
      :unit => 1,
      :quantity => 1,
      :price => 1.5,
      :quantity_used => 1,
      :cost => 1.5
    ))
  end

  it "renders the edit cost form" do
    render

    assert_select "form[action=?][method=?]", cost_path(@cost), "post" do

      assert_select "input[name=?]", "cost[ingredient]"

      assert_select "input[name=?]", "cost[unit]"

      assert_select "input[name=?]", "cost[quantity]"

      assert_select "input[name=?]", "cost[price]"

      assert_select "input[name=?]", "cost[quantity_used]"

      assert_select "input[name=?]", "cost[cost]"
    end
  end
end
