require 'rails_helper'

RSpec.describe "employee_absences/edit", type: :view do
  before(:each) do
    @employee_absence = assign(:employee_absence, EmployeeAbsence.create!(
      :employee => nil,
      :reason => "MyString"
    ))
  end

  it "renders the edit employee_absence form" do
    render

    assert_select "form[action=?][method=?]", employee_absence_path(@employee_absence), "post" do

      assert_select "input[name=?]", "employee_absence[employee_id]"

      assert_select "input[name=?]", "employee_absence[reason]"
    end
  end
end
