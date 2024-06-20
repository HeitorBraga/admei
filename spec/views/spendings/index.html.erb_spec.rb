require 'rails_helper'

RSpec.describe "spendings/index", type: :view do
  before(:each) do
    assign(:spendings, [
      Spending.create!(
        :origin => "Origin",
        :price => 2.5
      ),
      Spending.create!(
        :origin => "Origin",
        :price => 2.5
      )
    ])
  end

  it "renders a list of spendings" do
    render
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
