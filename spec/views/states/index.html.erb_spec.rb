require 'rails_helper'

RSpec.describe "states/index", type: :view do
  before(:each) do
    @states = create_list(:state, 3)
    assign(:states, State.all.paginate(page: 1))
  end

  it "renders a list of states" do
    render

    @states.each do |state|
      assert_select "tr>td", text: state.name
      assert_select "tr>td", text: state.uf
      assert_select "tr>td", text: state.ibge_code.to_s
      assert_select "tr>td", text: state.country.name
    end
  end
end
