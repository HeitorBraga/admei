require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        :invoicing => 2.5
      ),
      Sale.create!(
        :invoicing => 2.5
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
