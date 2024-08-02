require 'rails_helper'

RSpec.describe "collaborators/new", type: :view do
  before(:each) do
    assign(:collaborator, Collaborator.new(
      :name => "MyString",
      :type => 1
    ))
  end

  it "renders new collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborators_path, "post" do

      assert_select "input[name=?]", "collaborator[name]"

      assert_select "input[name=?]", "collaborator[type]"
    end
  end
end
