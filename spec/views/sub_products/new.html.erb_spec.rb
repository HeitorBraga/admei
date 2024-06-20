require 'rails_helper'

RSpec.describe "sub_products/new", type: :view do
  before(:each) do
    assign(:sub_product, SubProduct.new(
      :name => "MyString",
      :quantity => 1,
      :price => 1.5,
      :spending => nil
    ))
  end

  it "renders new sub_product form" do
    render

    assert_select "form[action=?][method=?]", sub_products_path, "post" do

      assert_select "input[name=?]", "sub_product[name]"

      assert_select "input[name=?]", "sub_product[quantity]"

      assert_select "input[name=?]", "sub_product[price]"

      assert_select "input[name=?]", "sub_product[spending_id]"
    end
  end
end
