require 'rails_helper'

RSpec.describe "employee_absences/new", type: :view do
  before(:each) do
    assign(:employee_absence, EmployeeAbsence.new(
      :employee => nil,
      :reason => "MyString"
    ))
  end

  it "renders new employee_absence form" do
    render

    assert_select "form[action=?][method=?]", employee_absences_path, "post" do

      assert_select "input[name=?]", "employee_absence[employee_id]"

      assert_select "input[name=?]", "employee_absence[reason]"
    end
  end
end
