require 'rails_helper'

RSpec.describe "PayLatters", type: :request do
  describe "GET /pay_latters" do
    it "works! (now write some real specs)" do
      get pay_latters_path
      expect(response).to have_http_status(200)
    end
  end
end
