require 'rails_helper'

RSpec.describe "AccountsPayables", type: :request do
  describe "GET /accounts_payables" do
    it "works! (now write some real specs)" do
      get accounts_payables_path
      expect(response).to have_http_status(200)
    end
  end
end
