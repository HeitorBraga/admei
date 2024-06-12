require "rails_helper"

RSpec.describe FabricationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/fabrications").to route_to("fabrications#index")
    end

    it "routes to #new" do
      expect(:get => "/fabrications/new").to route_to("fabrications#new")
    end

    it "routes to #show" do
      expect(:get => "/fabrications/1").to route_to("fabrications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fabrications/1/edit").to route_to("fabrications#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/fabrications").to route_to("fabrications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fabrications/1").to route_to("fabrications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fabrications/1").to route_to("fabrications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fabrications/1").to route_to("fabrications#destroy", :id => "1")
    end
  end
end
