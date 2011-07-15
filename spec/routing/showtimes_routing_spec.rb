require "spec_helper"

describe ShowtimesController do
  describe "routing" do

    it "routes only  to #index" do
      get("/showtimes").should route_to("showtimes#index")
      get("/showtimes/new").should_not be_routable
      get("/showtimes/1").should_not be_routable
      get("/showtimes/1/edit").should_not be_routable
      post("/showtimes").should_not be_routable
      put("/showtimes/1").should_not be_routable
      delete("/showtimes/1").should_not be_routable
    end

  end
end
