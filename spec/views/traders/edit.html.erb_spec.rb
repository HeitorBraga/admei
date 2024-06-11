require 'rails_helper'

RSpec.describe "traders/edit", type: :view do
  before(:each) do
    @trader = assign(:trader, create(:trader))
  end

  it "renders the edit trader form" do
    render

    assert_select "form[action=?][method=?]", trader_path(@trader), "post" do

      assert_select "select[name=?]", "trader[person_type]"

      assert_select "input[name=?]", "trader[name]"

      assert_select "select[name=?]", "trader[profiles][]"

      assert_select "select[name=?]", "trader[gender]"

      assert_select "input[name=?]", "trader[birth_date]"

      assert_select "input[name=?]", "trader[federal_tax_id]"

      assert_select "input[name=?]", "trader[state_tax_id]"

      assert_select "input[name=?]", "trader[phone]"

      assert_select "input[name=?]", "trader[mobile]"

      assert_select "input[name=?]", "trader[email]"
    end
  end
end
