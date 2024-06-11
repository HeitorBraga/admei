require 'rails_helper'

RSpec.describe "cities/new", type: :view do
  before(:each) do
    assign(:city, City.new)
  end

  it "renders new city form" do
    render

    assert_select "form[action=?][method=?]", cities_path, "post" do

      assert_select "input[name=?]", "city[name]"

      assert_select "select[name=?]", "city[state_id]"

      assert_select "input[name=?]", "city[ibge_code]"
    end
  end
end
