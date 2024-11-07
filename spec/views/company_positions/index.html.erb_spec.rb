require 'rails_helper'

RSpec.describe "company_positions/index", type: :view do
  before(:each) do
    assign(:company_positions, [
      CompanyPosition.create!(
        :name => "Name"
      ),
      CompanyPosition.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of company_positions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
