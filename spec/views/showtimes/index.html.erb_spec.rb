require 'spec_helper'

describe "showtimes/index.html.erb" do
  before(:each) do
    assign(:showtimes, Showtime.all)
  end

  it "renders a list of showtimes" do
    render
  end
end

