require 'rails_helper'

RSpec.describe "sub_products/edit", type: :view do
  before(:each) do
    @sub_product = assign(:sub_product, SubProduct.create!(
      :name => "MyString",
      :quantity => 1,
      :price => 1.5,
      :spending => nil
    ))
  end

  it "renders the edit sub_product form" do
    render

    assert_select "form[action=?][method=?]", sub_product_path(@sub_product), "post" do

      assert_select "input[name=?]", "sub_product[name]"

      assert_select "input[name=?]", "sub_product[quantity]"

      assert_select "input[name=?]", "sub_product[price]"

      assert_select "input[name=?]", "sub_product[spending_id]"
    end
  end
end
