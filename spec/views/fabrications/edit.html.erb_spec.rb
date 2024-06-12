require 'rails_helper'

RSpec.describe "fabrications/edit", type: :view do
  before(:each) do
    @fabrication = assign(:fabrication, Fabrication.create!(
      :month => 1
    ))
  end

  it "renders the edit fabrication form" do
    render

    assert_select "form[action=?][method=?]", fabrication_path(@fabrication), "post" do

      assert_select "input[name=?]", "fabrication[month]"
    end
  end
end
