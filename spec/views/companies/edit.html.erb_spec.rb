require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, create(:company))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input[name=?]", "company[trade_name]"

      assert_select "input[name=?]", "company[legal_name]"

      assert_select "input[name=?]", "company[federal_tax_id]"

      assert_select "input[name=?]", "company[state_tax_id]"
    end
  end
end
