require 'rails_helper'

RSpec.describe "spendings/new", type: :view do
  before(:each) do
    assign(:spending, Spending.new(
      :origin => "MyString",
      :price => 1.5
    ))
  end

  it "renders new spending form" do
    render

    assert_select "form[action=?][method=?]", spendings_path, "post" do

      assert_select "input[name=?]", "spending[origin]"

      assert_select "input[name=?]", "spending[price]"
    end
  end
end
