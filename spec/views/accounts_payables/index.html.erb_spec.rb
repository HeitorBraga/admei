require 'rails_helper'

RSpec.describe "accounts_payables/index", type: :view do
  before(:each) do
    assign(:accounts_payables, [
      AccountsPayable.create!(
        :name => "Name",
        :price => 2
      ),
      AccountsPayable.create!(
        :name => "Name",
        :price => 2
      )
    ])
  end

  it "renders a list of accounts_payables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
