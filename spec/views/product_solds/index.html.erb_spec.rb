require 'rails_helper'

RSpec.describe "product_solds/index", type: :view do
  before(:each) do
    assign(:product_solds, [
      ProductSold.create!(
        :sale => nil,
        :product => 2,
        :quantity => 3
      ),
      ProductSold.create!(
        :sale => nil,
        :product => 2,
        :quantity => 3
      )
    ])
  end

  it "renders a list of product_solds" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
