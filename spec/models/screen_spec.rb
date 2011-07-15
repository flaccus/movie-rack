require 'spec_helper'

describe Screen do
  before :all do
    @theater = Theater.new(:name=>"Test Theater")
    @screen = Screen.new(:name=>"Screen1",:seating_capacity=>500)
    @theater.screens << @screen
    @theater.save
    @movie = Movie.new(:title=>"Test Movie 1", :running_time=>Time.now(), :rating=>"PG")

    @showtimes = Showtime.create([
      {:movie_id => @movie.id, :screen_id => @screen.id, :start_time=> "10:00:00" },
      {:movie_id => @movie.id, :screen_id => @screen.id, :start_time=> "13:00:00" },
      {:movie_id => @movie.id, :screen_id => @screen.id, :start_time=> "16:00:00" }
    ])
  end

  after :all do
    @showtimes.each {|s| s.delete }
    @screen.delete
    @theater.delete
    @movie.delete
  end

  it "should provide cheap seats covering ten per cent of total seating" do
    @screen.cheap_seats.should == (@screen.seating_capacity / 10)
  end

  it "should have a theater" do
    @screen.theater.id.should == @theater.id
  end
  
  it "should have showtimes" do
    @screen.showtimes.should eq(Showtime.where("screen_id = ?", @screen.id))
  end
  
end
