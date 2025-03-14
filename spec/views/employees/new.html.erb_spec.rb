require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      :name => "MyString",
      :phone => "MyString",
      :company_position => nil,
      :wage => 1.5
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[phone]"

      assert_select "input[name=?]", "employee[company_position_id]"

      assert_select "input[name=?]", "employee[wage]"
    end
  end
end
