require 'rails_helper'

RSpec.describe "spendings/show", type: :view do
  before(:each) do
    @spending = assign(:spending, Spending.create!(
      :origin => "Origin",
      :price => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/2.5/)
  end
end
