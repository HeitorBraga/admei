require "rails_helper"

RSpec.describe ProductSoldsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_solds").to route_to("product_solds#index")
    end

    it "routes to #new" do
      expect(:get => "/product_solds/new").to route_to("product_solds#new")
    end

    it "routes to #show" do
      expect(:get => "/product_solds/1").to route_to("product_solds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_solds/1/edit").to route_to("product_solds#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_solds").to route_to("product_solds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_solds/1").to route_to("product_solds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_solds/1").to route_to("product_solds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_solds/1").to route_to("product_solds#destroy", :id => "1")
    end
  end
end
