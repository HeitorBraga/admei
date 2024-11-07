require 'rails_helper'

RSpec.describe "company_positions/show", type: :view do
  before(:each) do
    @company_position = assign(:company_position, CompanyPosition.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
