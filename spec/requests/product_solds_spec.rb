require 'rails_helper'

RSpec.describe "ProductSolds", type: :request do
  describe "GET /product_solds" do
    it "works! (now write some real specs)" do
      get product_solds_path
      expect(response).to have_http_status(200)
    end
  end
end
