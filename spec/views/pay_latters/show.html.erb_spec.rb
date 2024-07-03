require 'rails_helper'

RSpec.describe "pay_latters/show", type: :view do
  before(:each) do
    @pay_latter = assign(:pay_latter, PayLatter.create!(
      :name => "Name",
      :phone => 2,
      :price => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end
