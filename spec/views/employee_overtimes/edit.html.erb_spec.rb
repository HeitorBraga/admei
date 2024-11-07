require 'rails_helper'

RSpec.describe "employee_overtimes/edit", type: :view do
  before(:each) do
    @employee_overtime = assign(:employee_overtime, EmployeeOvertime.create!(
      :employee => nil,
      :hours => 1
    ))
  end

  it "renders the edit employee_overtime form" do
    render

    assert_select "form[action=?][method=?]", employee_overtime_path(@employee_overtime), "post" do

      assert_select "input[name=?]", "employee_overtime[employee_id]"

      assert_select "input[name=?]", "employee_overtime[hours]"
    end
  end
end
