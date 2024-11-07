require 'rails_helper'

RSpec.describe "employee_overtimes/new", type: :view do
  before(:each) do
    assign(:employee_overtime, EmployeeOvertime.new(
      :employee => nil,
      :hours => 1
    ))
  end

  it "renders new employee_overtime form" do
    render

    assert_select "form[action=?][method=?]", employee_overtimes_path, "post" do

      assert_select "input[name=?]", "employee_overtime[employee_id]"

      assert_select "input[name=?]", "employee_overtime[hours]"
    end
  end
end
