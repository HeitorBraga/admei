require 'rails_helper'

RSpec.describe "states/show", type: :view do
  before(:each) do
    @state = assign(:state, create(:state))
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(/#{@state.name}/)
    expect(rendered).to match(/#{@state.uf}/)
    expect(rendered).to match(/#{@state.ibge_code.to_s}/)
    expect(rendered).to match(/#{@state.country_id}/)
  end
end
