require 'rails_helper'

RSpec.describe "EmployeeAbsences", type: :request do
  describe "GET /employee_absences" do
    it "works! (now write some real specs)" do
      get employee_absences_path
      expect(response).to have_http_status(200)
    end
  end
end
