require 'rails_helper'

RSpec.describe "banks/edit", type: :view do
  before(:each) do
    @bank = assign(:bank, Bank.create!(
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit bank form" do
    render

    assert_select "form[action=?][method=?]", bank_path(@bank), "post" do

      assert_select "input[name=?]", "bank[code]"

      assert_select "input[name=?]", "bank[name]"
    end
  end
end
