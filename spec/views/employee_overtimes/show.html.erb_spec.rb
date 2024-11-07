require 'rails_helper'

RSpec.describe "employee_overtimes/show", type: :view do
  before(:each) do
    @employee_overtime = assign(:employee_overtime, EmployeeOvertime.create!(
      :employee => nil,
      :hours => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
