require 'rails_helper'

RSpec.describe "cities/show", type: :view do
  before(:each) do
    @city = assign(:city, create(:city))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@city.name}/)
    expect(rendered).to match(/#{@city.ibge_code}/)
  end
end
