require "rails_helper"

RSpec.describe AccountsPayablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/accounts_payables").to route_to("accounts_payables#index")
    end

    it "routes to #new" do
      expect(:get => "/accounts_payables/new").to route_to("accounts_payables#new")
    end

    it "routes to #show" do
      expect(:get => "/accounts_payables/1").to route_to("accounts_payables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/accounts_payables/1/edit").to route_to("accounts_payables#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/accounts_payables").to route_to("accounts_payables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accounts_payables/1").to route_to("accounts_payables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accounts_payables/1").to route_to("accounts_payables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accounts_payables/1").to route_to("accounts_payables#destroy", :id => "1")
    end
  end
end
