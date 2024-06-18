require 'rails_helper'

RSpec.describe "ProductCosts", type: :request do
  describe "GET /product_costs" do
    it "works! (now write some real specs)" do
      get product_costs_path
      expect(response).to have_http_status(200)
    end
  end
end
