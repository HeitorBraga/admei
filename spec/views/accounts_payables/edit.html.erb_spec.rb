require 'rails_helper'

RSpec.describe "accounts_payables/edit", type: :view do
  before(:each) do
    @accounts_payable = assign(:accounts_payable, AccountsPayable.create!(
      :name => "MyString",
      :price => 1
    ))
  end

  it "renders the edit accounts_payable form" do
    render

    assert_select "form[action=?][method=?]", accounts_payable_path(@accounts_payable), "post" do

      assert_select "input[name=?]", "accounts_payable[name]"

      assert_select "input[name=?]", "accounts_payable[price]"
    end
  end
end
