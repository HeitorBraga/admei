require 'rails_helper'

RSpec.describe "fabrications/show", type: :view do
  before(:each) do
    @fabrication = assign(:fabrication, Fabrication.create!(
      :month => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
