require "rails_helper"

RSpec.describe TradersController, type: :routing do
  describe "routing" do
    before do
      allow(SubdomainPresent).to receive(:matches?).and_return(true)
    end

    it "routes to #index" do
      expect(:get => "/traders").to route_to("traders#index")
    end

    it "routes to #new" do
      expect(:get => "/traders/new").to route_to("traders#new")
    end

    it "routes to #show" do
      expect(:get => "/traders/1").to route_to("traders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/traders/1/edit").to route_to("traders#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/traders").to route_to("traders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/traders/1").to route_to("traders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/traders/1").to route_to("traders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/traders/1").to route_to("traders#destroy", :id => "1")
    end
  end
end
