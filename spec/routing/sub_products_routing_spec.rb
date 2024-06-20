require "rails_helper"

RSpec.describe SubProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sub_products").to route_to("sub_products#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_products/new").to route_to("sub_products#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_products/1").to route_to("sub_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_products/1/edit").to route_to("sub_products#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sub_products").to route_to("sub_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sub_products/1").to route_to("sub_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sub_products/1").to route_to("sub_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_products/1").to route_to("sub_products#destroy", :id => "1")
    end
  end
end
