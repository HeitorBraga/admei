require 'rails_helper'

RSpec.describe "accounts_payables/show", type: :view do
  before(:each) do
    @accounts_payable = assign(:accounts_payable, AccountsPayable.create!(
      :name => "Name",
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
