require 'rails_helper'

RSpec.describe "countries/edit", type: :view do
  before(:each) do
    @country = assign(:country, create(:country))
  end

  it "renders the edit country form" do
    render

    assert_select "form[action=?][method=?]", country_path(@country), "post" do

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[iso_code]"

      assert_select "input[name=?]", "country[ibge_code]"
    end
  end
end
