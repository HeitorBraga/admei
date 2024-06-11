require 'rails_helper'

RSpec.describe "apps/index", type: :view do
  before(:each) do
    assign(:apps, [
      App.create!(
        :name => "Name",
        :tenant => nil,
        :secret => "Secret"
      ),
      App.create!(
        :name => "Name",
        :tenant => nil,
        :secret => "Secret"
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Secret".to_s, :count => 2
  end
end
