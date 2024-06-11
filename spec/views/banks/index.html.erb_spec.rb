require 'rails_helper'

RSpec.describe "banks/index", type: :view do
  before(:each) do
    assign(:banks, [
      Bank.create!(
        :code => "Code",
        :name => "Name"
      ),
      Bank.create!(
        :code => "Code",
        :name => "Name"
      )
    ])
  end

  it "renders a list of banks" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
