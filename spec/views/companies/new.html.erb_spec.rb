require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new)
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[trade_name]"

      assert_select "input[name=?]", "company[legal_name]"

      assert_select "input[name=?]", "company[federal_tax_id]"

      assert_select "input[name=?]", "company[state_tax_id]"
    end
  end
end
