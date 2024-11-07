require "rails_helper"

RSpec.describe EmployeeAbsencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/employee_absences").to route_to("employee_absences#index")
    end

    it "routes to #new" do
      expect(:get => "/employee_absences/new").to route_to("employee_absences#new")
    end

    it "routes to #show" do
      expect(:get => "/employee_absences/1").to route_to("employee_absences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/employee_absences/1/edit").to route_to("employee_absences#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/employee_absences").to route_to("employee_absences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/employee_absences/1").to route_to("employee_absences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/employee_absences/1").to route_to("employee_absences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/employee_absences/1").to route_to("employee_absences#destroy", :id => "1")
    end
  end
end
