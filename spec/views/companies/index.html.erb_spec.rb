require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    @companies = create_list(:company, 3)
    assign(:companies, Company.all.paginate(page: 1))
  end

  it "renders a list of companies" do
    render
    @companies.each do |company|
      assert_select "tr>td", text: company.trade_name
      assert_select "tr>td", text: company.legal_name
      assert_select "tr>td", text: company.federal_tax_id
      assert_select "tr>td", text: company.state_tax_id
    end
  end
end
