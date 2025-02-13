require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      :name => "MyString",
      :phone => "MyString",
      :company_position => nil,
      :wage => 1.5
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[phone]"

      assert_select "input[name=?]", "employee[company_position_id]"

      assert_select "input[name=?]", "employee[wage]"
    end
  end
end
