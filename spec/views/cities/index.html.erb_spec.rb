require 'rails_helper'

RSpec.describe "cities/index", type: :view do
  before(:each) do
    @cities = create_list(:city, 2)
    assign(:cities, City.all.paginate(page: 1))
  end

  it "renders a list of cities" do
    render

    @cities.each do |city|
      assert_select "tr>td", text: city.name
      assert_select "tr>td", text: city.state.uf
      assert_select "tr>td", text: city.ibge_code.to_s
    end
  end
end
