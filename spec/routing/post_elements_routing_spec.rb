require "rails_helper"

RSpec.describe PostElementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/post_elements").to route_to("post_elements#index")
    end

    it "routes to #new" do
      expect(get: "/post_elements/new").to route_to("post_elements#new")
    end

    it "routes to #show" do
      expect(get: "/post_elements/1").to route_to("post_elements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/post_elements/1/edit").to route_to("post_elements#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/post_elements").to route_to("post_elements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/post_elements/1").to route_to("post_elements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/post_elements/1").to route_to("post_elements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/post_elements/1").to route_to("post_elements#destroy", id: "1")
    end
  end
end
