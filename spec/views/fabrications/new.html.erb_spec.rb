require 'rails_helper'

RSpec.describe "fabrications/new", type: :view do
  before(:each) do
    assign(:fabrication, Fabrication.new(
      :month => 1
    ))
  end

  it "renders new fabrication form" do
    render

    assert_select "form[action=?][method=?]", fabrications_path, "post" do

      assert_select "input[name=?]", "fabrication[month]"
    end
  end
end
