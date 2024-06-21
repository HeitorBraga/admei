require 'rails_helper'

RSpec.describe "product_solds/show", type: :view do
  before(:each) do
    @product_sold = assign(:product_sold, ProductSold.create!(
      :sale => nil,
      :product => 2,
      :quantity => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
