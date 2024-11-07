require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      :name => "Name",
      :phone => "Phone",
      :company_position => nil,
      :wage => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
