require 'rails_helper'

RSpec.describe "company_positions/edit", type: :view do
  before(:each) do
    @company_position = assign(:company_position, CompanyPosition.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit company_position form" do
    render

    assert_select "form[action=?][method=?]", company_position_path(@company_position), "post" do

      assert_select "input[name=?]", "company_position[name]"
    end
  end
end
