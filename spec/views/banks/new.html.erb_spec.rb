require 'rails_helper'

RSpec.describe "banks/new", type: :view do
  before(:each) do
    assign(:bank, Bank.new(
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new bank form" do
    render

    assert_select "form[action=?][method=?]", banks_path, "post" do

      assert_select "input[name=?]", "bank[code]"

      assert_select "input[name=?]", "bank[name]"
    end
  end
end
