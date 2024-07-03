require "rails_helper"

RSpec.describe PayLattersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pay_latters").to route_to("pay_latters#index")
    end

    it "routes to #new" do
      expect(:get => "/pay_latters/new").to route_to("pay_latters#new")
    end

    it "routes to #show" do
      expect(:get => "/pay_latters/1").to route_to("pay_latters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pay_latters/1/edit").to route_to("pay_latters#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pay_latters").to route_to("pay_latters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pay_latters/1").to route_to("pay_latters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pay_latters/1").to route_to("pay_latters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pay_latters/1").to route_to("pay_latters#destroy", :id => "1")
    end
  end
end
