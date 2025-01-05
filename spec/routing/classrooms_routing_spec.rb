require "rails_helper"

RSpec.describe V1::ClassroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/classrooms").to route_to("v1/classrooms#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/classrooms/1").to route_to("v1/classrooms#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/classrooms").to route_to("v1/classrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/classrooms/1").to route_to("v1/classrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/classrooms/1").to route_to("v1/classrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/classrooms/1").to route_to("v1/classrooms#destroy", id: "1")
    end
  end
end
