require 'rails_helper'

RSpec.describe "product_solds/edit", type: :view do
  before(:each) do
    @product_sold = assign(:product_sold, ProductSold.create!(
      :sale => nil,
      :product => 1,
      :quantity => 1
    ))
  end

  it "renders the edit product_sold form" do
    render

    assert_select "form[action=?][method=?]", product_sold_path(@product_sold), "post" do

      assert_select "input[name=?]", "product_sold[sale_id]"

      assert_select "input[name=?]", "product_sold[product]"

      assert_select "input[name=?]", "product_sold[quantity]"
    end
  end
end
