require 'rails_helper'

RSpec.describe "employee_overtimes/index", type: :view do
  before(:each) do
    assign(:employee_overtimes, [
      EmployeeOvertime.create!(
        :employee => nil,
        :hours => 2
      ),
      EmployeeOvertime.create!(
        :employee => nil,
        :hours => 2
      )
    ])
  end

  it "renders a list of employee_overtimes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
