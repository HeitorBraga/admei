require 'rails_helper'

RSpec.describe "sub_products/index", type: :view do
  before(:each) do
    assign(:sub_products, [
      SubProduct.create!(
        :name => "Name",
        :quantity => 2,
        :price => 3.5,
        :spending => nil
      ),
      SubProduct.create!(
        :name => "Name",
        :quantity => 2,
        :price => 3.5,
        :spending => nil
      )
    ])
  end

  it "renders a list of sub_products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
