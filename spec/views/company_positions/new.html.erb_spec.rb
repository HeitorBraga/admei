require 'rails_helper'

RSpec.describe "company_positions/new", type: :view do
  before(:each) do
    assign(:company_position, CompanyPosition.new(
      :name => "MyString"
    ))
  end

  it "renders new company_position form" do
    render

    assert_select "form[action=?][method=?]", company_positions_path, "post" do

      assert_select "input[name=?]", "company_position[name]"
    end
  end
end
