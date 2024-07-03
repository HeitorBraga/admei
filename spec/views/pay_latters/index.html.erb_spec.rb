require 'rails_helper'

RSpec.describe "pay_latters/index", type: :view do
  before(:each) do
    assign(:pay_latters, [
      PayLatter.create!(
        :name => "Name",
        :phone => 2,
        :price => 3.5
      ),
      PayLatter.create!(
        :name => "Name",
        :phone => 2,
        :price => 3.5
      )
    ])
  end

  it "renders a list of pay_latters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
