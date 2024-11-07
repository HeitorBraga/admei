require 'rails_helper'

RSpec.describe "employee_absences/index", type: :view do
  before(:each) do
    assign(:employee_absences, [
      EmployeeAbsence.create!(
        :employee => nil,
        :reason => "Reason"
      ),
      EmployeeAbsence.create!(
        :employee => nil,
        :reason => "Reason"
      )
    ])
  end

  it "renders a list of employee_absences" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
  end
end
