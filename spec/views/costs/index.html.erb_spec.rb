require 'rails_helper'

RSpec.describe "costs/index", type: :view do
  before(:each) do
    assign(:costs, [
      Cost.create!(
        :ingredient => "Ingredient",
        :unit => 2,
        :quantity => 3,
        :price => 4.5,
        :quantity_used => 5,
        :cost => 6.5
      ),
      Cost.create!(
        :ingredient => "Ingredient",
        :unit => 2,
        :quantity => 3,
        :price => 4.5,
        :quantity_used => 5,
        :cost => 6.5
      )
    ])
  end

  it "renders a list of costs" do
    render
    assert_select "tr>td", :text => "Ingredient".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
  end
end
