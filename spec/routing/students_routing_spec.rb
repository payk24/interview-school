require "rails_helper"

RSpec.describe V1::StudentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/students").to route_to("v1/students#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/students/1").to route_to("v1/students#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/students").to route_to("v1/students#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/students/1").to route_to("v1/students#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/students/1").to route_to("v1/students#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/students/1").to route_to("v1/students#destroy", id: "1")
    end
  end
end
