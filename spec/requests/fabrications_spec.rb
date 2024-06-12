require 'rails_helper'

RSpec.describe "Fabrications", type: :request do
  describe "GET /fabrications" do
    it "works! (now write some real specs)" do
      get fabrications_path
      expect(response).to have_http_status(200)
    end
  end
end
