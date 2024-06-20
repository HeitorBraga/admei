require 'rails_helper'

RSpec.describe "SubProducts", type: :request do
  describe "GET /sub_products" do
    it "works! (now write some real specs)" do
      get sub_products_path
      expect(response).to have_http_status(200)
    end
  end
end
