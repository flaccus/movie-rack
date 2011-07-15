require "spec_helper"

describe TicketsController do
  describe "routing" do

    it "only routes to #new and #create" do
      get("/tickets").should_not be_routable
      get("/tickets/new").should route_to("tickets#new")
      get("/tickets/1").should_not be_routable
      get("/tickets/1/edit").should_not be_routable
      post("/tickets").should route_to("tickets#create")
      put("/tickets/1").should_not be_routable
      delete("/tickets/1").should_not be_routable
    end

  end
end
