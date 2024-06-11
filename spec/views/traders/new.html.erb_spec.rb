require 'rails_helper'

RSpec.describe "traders/new", type: :view do
  before(:each) do
    assign(:trader, Trader.new)
  end

  it "renders new trader form" do
    render

    assert_select "form[action=?][method=?]", traders_path, "post" do

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
