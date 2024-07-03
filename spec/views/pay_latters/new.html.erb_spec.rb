require 'rails_helper'

RSpec.describe "pay_latters/new", type: :view do
  before(:each) do
    assign(:pay_latter, PayLatter.new(
      :name => "MyString",
      :phone => 1,
      :price => 1.5
    ))
  end

  it "renders new pay_latter form" do
    render

    assert_select "form[action=?][method=?]", pay_latters_path, "post" do

      assert_select "input[name=?]", "pay_latter[name]"

      assert_select "input[name=?]", "pay_latter[phone]"

      assert_select "input[name=?]", "pay_latter[price]"
    end
  end
end
