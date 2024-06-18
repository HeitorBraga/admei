require "rails_helper"

RSpec.describe ProductCostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_costs").to route_to("product_costs#index")
    end

    it "routes to #new" do
      expect(:get => "/product_costs/new").to route_to("product_costs#new")
    end

    it "routes to #show" do
      expect(:get => "/product_costs/1").to route_to("product_costs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_costs/1/edit").to route_to("product_costs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_costs").to route_to("product_costs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_costs/1").to route_to("product_costs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_costs/1").to route_to("product_costs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_costs/1").to route_to("product_costs#destroy", :id => "1")
    end
  end
end
