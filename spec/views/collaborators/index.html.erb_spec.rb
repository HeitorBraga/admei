require 'rails_helper'

RSpec.describe "collaborators/index", type: :view do
  before(:each) do
    assign(:collaborators, [
      Collaborator.create!(
        :name => "Name",
        :type => 2
      ),
      Collaborator.create!(
        :name => "Name",
        :type => 2
      )
    ])
  end

  it "renders a list of collaborators" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
