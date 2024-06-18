require 'rails_helper'

RSpec.describe "costs/show", type: :view do
  before(:each) do
    @cost = assign(:cost, Cost.create!(
      :ingredient => "Ingredient",
      :unit => 2,
      :quantity => 3,
      :price => 4.5,
      :quantity_used => 5,
      :cost => 6.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ingredient/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6.5/)
  end
end
