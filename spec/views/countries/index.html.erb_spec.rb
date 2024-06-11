require 'rails_helper'

RSpec.describe "countries/index", type: :view do
  before(:each) do
    @countries = create_list(:country, 3)
    assign(:countries, Country.all.paginate(page: 1))
  end

  it "renders a list of countries" do
    render

    @countries.each do |country|
      assert_select "tr>td", text: country.name
      assert_select "tr>td", text: country.iso_code
      assert_select "tr>td", text: country.ibge_code.to_s
    end
  end
end
