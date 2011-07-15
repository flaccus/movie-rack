require 'spec_helper'

describe "Showtimes" do
  describe "GET /showtimes" do
    it "should provide a list with filtering capabilities" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get showtimes_path
      response.should render_template(:index)
      response.status.should be(200)

      get showtimes_path, :time_of_day => "10:15"
      response.should render_template(:index)
      response.status.should be(200)
    end
  end
end
