require 'rails_helper'

RSpec.describe "pay_latters/edit", type: :view do
  before(:each) do
    @pay_latter = assign(:pay_latter, PayLatter.create!(
      :name => "MyString",
      :phone => 1,
      :price => 1.5
    ))
  end

  it "renders the edit pay_latter form" do
    render

    assert_select "form[action=?][method=?]", pay_latter_path(@pay_latter), "post" do

      assert_select "input[name=?]", "pay_latter[name]"

      assert_select "input[name=?]", "pay_latter[phone]"

      assert_select "input[name=?]", "pay_latter[price]"
    end
  end
end
