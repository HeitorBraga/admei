require 'rails_helper'

RSpec.describe "cities/edit", type: :view do
  before(:each) do
    @city = create(:city)
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", city_path(@city), "post" do

      assert_select "input[name=?]", "city[name]"

      assert_select "select[name=?]", "city[state_id]"

      assert_select "input[name=?]", "city[ibge_code]"
    end
  end
end
