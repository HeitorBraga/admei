require 'rails_helper'

RSpec.describe "product_costs/show", type: :view do
  before(:each) do
    @product_cost = assign(:product_cost, ProductCost.create!(
      :product => nil,
      :cost => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
