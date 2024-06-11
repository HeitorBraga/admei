require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, create(:company))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@company.trade_name}/)
    expect(rendered).to match(/#{@company.legal_name}/)
    expect(rendered).to match(/#{@company.federal_tax_id}/)
    expect(rendered).to match(/#{@company.state_tax_id}/)
  end
end
