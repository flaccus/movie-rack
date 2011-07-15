require 'spec_helper'

describe Movie do
  it "should have showtimes" do
    Movie.first.showtimes.should eq(Showtime.where("movie_id= ?", Movie.first.id))
  end
end
