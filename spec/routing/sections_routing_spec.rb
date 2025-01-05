require "rails_helper"

RSpec.describe V1::SectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/sections").to route_to("v1/sections#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/sections/1").to route_to("v1/sections#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/sections").to route_to("v1/sections#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/sections/1").to route_to("v1/sections#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/sections/1").to route_to("v1/sections#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/sections/1").to route_to("v1/sections#destroy", id: "1")
    end
  end
end
