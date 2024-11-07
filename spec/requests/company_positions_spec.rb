require 'rails_helper'

RSpec.describe "CompanyPositions", type: :request do
  describe "GET /company_positions" do
    it "works! (now write some real specs)" do
      get company_positions_path
      expect(response).to have_http_status(200)
    end
  end
end
