require "rails_helper"

RSpec.describe EmployeeOvertimesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/employee_overtimes").to route_to("employee_overtimes#index")
    end

    it "routes to #new" do
      expect(:get => "/employee_overtimes/new").to route_to("employee_overtimes#new")
    end

    it "routes to #show" do
      expect(:get => "/employee_overtimes/1").to route_to("employee_overtimes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/employee_overtimes/1/edit").to route_to("employee_overtimes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/employee_overtimes").to route_to("employee_overtimes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/employee_overtimes/1").to route_to("employee_overtimes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/employee_overtimes/1").to route_to("employee_overtimes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/employee_overtimes/1").to route_to("employee_overtimes#destroy", :id => "1")
    end
  end
end
