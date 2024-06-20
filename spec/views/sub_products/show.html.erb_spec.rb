require 'rails_helper'

RSpec.describe "sub_products/show", type: :view do
  before(:each) do
    @sub_product = assign(:sub_product, SubProduct.create!(
      :name => "Name",
      :quantity => 2,
      :price => 3.5,
      :spending => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(//)
  end
end
