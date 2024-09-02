require "rails_helper"

RSpec.describe CashRegistersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cash_registers").to route_to("cash_registers#index")
    end

    it "routes to #new" do
      expect(:get => "/cash_registers/new").to route_to("cash_registers#new")
    end

    it "routes to #show" do
      expect(:get => "/cash_registers/1").to route_to("cash_registers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cash_registers/1/edit").to route_to("cash_registers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cash_registers").to route_to("cash_registers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cash_registers/1").to route_to("cash_registers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cash_registers/1").to route_to("cash_registers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cash_registers/1").to route_to("cash_registers#destroy", :id => "1")
    end
  end
end
