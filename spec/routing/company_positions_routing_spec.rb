require "rails_helper"

RSpec.describe CompanyPositionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/company_positions").to route_to("company_positions#index")
    end

    it "routes to #new" do
      expect(:get => "/company_positions/new").to route_to("company_positions#new")
    end

    it "routes to #show" do
      expect(:get => "/company_positions/1").to route_to("company_positions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/company_positions/1/edit").to route_to("company_positions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/company_positions").to route_to("company_positions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/company_positions/1").to route_to("company_positions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/company_positions/1").to route_to("company_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/company_positions/1").to route_to("company_positions#destroy", :id => "1")
    end
  end
end
