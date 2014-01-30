require "spec_helper"

describe TarotsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tarots").to route_to("tarots#index")
    end

    it "routes to #new" do
      expect(:get => "/tarots/new").to route_to("tarots#new")
    end

    it "routes to #show" do
      expect(:get => "/tarots/1").to route_to("tarots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tarots/1/edit").to route_to("tarots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tarots").to route_to("tarots#create")
    end

    it "routes to #update" do
      expect(:put => "/tarots/1").to route_to("tarots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tarots/1").to route_to("tarots#destroy", :id => "1")
    end

  end
end
