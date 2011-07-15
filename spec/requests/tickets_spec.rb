require 'spec_helper'

describe "Tickets" do
    it "creates a ticket and redirects to showtimes index page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_ticket_path(:showtime_id=>Showtime.last.id)
      response.should render_template(:new)
      
      post "/tickets", :ticket=> {:email=>"joe.customer@example.com", :seats=>2, :showtime_id => Showtime.first.id }
      response.should redirect_to(showtimes_path)
      
      follow_redirect!
      
      response.should render_template(:index)
      response.status.should be(200)
    end
end
