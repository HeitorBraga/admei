require 'rails_helper'

RSpec.describe "spendings/edit", type: :view do
  before(:each) do
    @spending = assign(:spending, Spending.create!(
      :origin => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit spending form" do
    render

    assert_select "form[action=?][method=?]", spending_path(@spending), "post" do

      assert_select "input[name=?]", "spending[origin]"

      assert_select "input[name=?]", "spending[price]"
    end
  end
end
