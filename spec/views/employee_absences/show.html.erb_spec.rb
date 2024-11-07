require 'rails_helper'

RSpec.describe "employee_absences/show", type: :view do
  before(:each) do
    @employee_absence = assign(:employee_absence, EmployeeAbsence.create!(
      :employee => nil,
      :reason => "Reason"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Reason/)
  end
end
