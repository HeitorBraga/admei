require 'rails_helper'

RSpec.describe "states/edit", type: :view do
  before(:each) do
    @state = assign(:state, create(:state))
  end

  it "renders the edit state form" do
    render

    assert_select "form[action=?][method=?]", state_path(@state), "post" do

      assert_select "input[name=?]", "state[name]"

      assert_select "input[name=?]", "state[uf]"

      assert_select "input[name=?]", "state[ibge_code]"

      assert_select "select[name=?]", "state[country_id]"
    end
  end
end
