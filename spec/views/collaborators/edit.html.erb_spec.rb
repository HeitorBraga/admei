require 'rails_helper'

RSpec.describe "collaborators/edit", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :name => "MyString",
      :type => 1
    ))
  end

  it "renders the edit collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborator_path(@collaborator), "post" do

      assert_select "input[name=?]", "collaborator[name]"

      assert_select "input[name=?]", "collaborator[type]"
    end
  end
end
