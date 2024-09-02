require 'rails_helper'

RSpec.describe "CashRegisters", type: :request do
  describe "GET /cash_registers" do
    it "works! (now write some real specs)" do
      get cash_registers_path
      expect(response).to have_http_status(200)
    end
  end
end
