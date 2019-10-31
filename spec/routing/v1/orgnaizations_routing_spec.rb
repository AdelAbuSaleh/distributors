require "rails_helper"

RSpec.describe V1::OrgnaizationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/v1/orgnaizations").to route_to("v1/orgnaizations#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/orgnaizations/new").to route_to("v1/orgnaizations#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/orgnaizations/1").to route_to("v1/orgnaizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/orgnaizations/1/edit").to route_to("v1/orgnaizations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/v1/orgnaizations").to route_to("v1/orgnaizations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/orgnaizations/1").to route_to("v1/orgnaizations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/orgnaizations/1").to route_to("v1/orgnaizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/orgnaizations/1").to route_to("v1/orgnaizations#destroy", :id => "1")
    end
  end
end
