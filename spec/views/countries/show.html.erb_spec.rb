require 'rails_helper'

RSpec.describe "countries/show", type: :view do
  before(:each) do
    @country = assign(:country, create(:country))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@country.name}/)
    expect(rendered).to match(/#{@country.ibge_code}/)
    expect(rendered).to match(/#{@country.iso_code}/)
  end
end
