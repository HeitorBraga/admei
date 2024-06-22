require 'rails_helper'

RSpec.describe "product_solds/new", type: :view do
  before(:each) do
    assign(:product_sold, ProductSold.new(
      :sale => nil,
      :product => 1,
      :quantity => 1
    ))
  end

  it "renders new product_sold form" do
    render

    assert_select "form[action=?][method=?]", product_solds_path, "post" do

      assert_select "input[name=?]", "product_sold[sale_id]"

      assert_select "input[name=?]", "product_sold[product]"

      assert_select "input[name=?]", "product_sold[quantity]"
    end
  end
end
