require 'rails_helper'

RSpec.describe "EmployeeOvertimes", type: :request do
  describe "GET /employee_overtimes" do
    it "works! (now write some real specs)" do
      get employee_overtimes_path
      expect(response).to have_http_status(200)
    end
  end
end
