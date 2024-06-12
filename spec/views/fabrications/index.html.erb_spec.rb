require 'rails_helper'

RSpec.describe "fabrications/index", type: :view do
  before(:each) do
    assign(:fabrications, [
      Fabrication.create!(
        :month => 2
      ),
      Fabrication.create!(
        :month => 2
      )
    ])
  end

  it "renders a list of fabrications" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
