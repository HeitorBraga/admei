require 'rails_helper'

RSpec.describe "states/new", type: :view do
  before(:each) do
    assign(:state, State.new)
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do

      assert_select "input[name=?]", "state[name]"

      assert_select "input[name=?]", "state[uf]"

      assert_select "input[name=?]", "state[ibge_code]"

      assert_select "select[name=?]", "state[country_id]"
    end
  end
end
