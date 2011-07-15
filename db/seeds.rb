# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Showtime.destroy_all
Screen.destroy_all
Theater.destroy_all
Movie.destroy_all
Ticket.destroy_all

movies = Movie.create([
  {:title => "A Great Movie", :running_time=>120, :rating=>"PG"},
  {:title => "Another Great Movie", :running_time=>90, :rating=>"R"},
  {:title => "Yet Another", :running_time=>115, :rating => "PG13"},
  {:title => "A really, really long movie", :running_time => 180, :rating =>"PG" }
])

theatres = Theater.create([
  {:name=>"AMC Theaters 5", :address=>"55 Main St.", :city=>"Somewhere", :state=>"IN", :zip=>"46530" },
  {:name=>"General Cinema 4", :address=>"123 Broadway Blvd.", :city=>"Somewhere", :state=>"IN", :zip=>"46530" }
])


theatres.first.screens << Screen.create([
    {:name=>"A", :seating_capacity=>120},
    {:name=>"B", :seating_capacity=>160},
    {:name=>"C", :seating_capacity=>320},
    {:name=>"D", :seating_capacity=>90},
    {:name=>"E", :seating_capacity=>120}
])

theatres.last.screens << Screen.create([
    {:name=>"1", :seating_capacity=>120},
    {:name=>"2", :seating_capacity=>260},
    {:name=>"3", :seating_capacity=>220},
    {:name=>"4", :seating_capacity=>90},
])

showtimes = Showtime.create([
    {:movie_id => movies[0].id, :screen_id => theatres.first.screens[0].id, :start_time=> "10:00:00" },
    {:movie_id => movies[1].id, :screen_id => theatres.first.screens[1].id, :start_time=> "11:15:00" },
    {:movie_id => movies[2].id, :screen_id => theatres.first.screens[2].id, :start_time=> "11:45:00" },
    {:movie_id => movies[3].id, :screen_id => theatres.first.screens[3].id, :start_time=> "12:15:00" },
    {:movie_id => movies[3].id, :screen_id => theatres.first.screens[4].id, :start_time=> "10:15:00" },
    {:movie_id => movies[0].id, :screen_id => theatres.last.screens[0].id, :start_time=> "10:00:00" },
    {:movie_id => movies[1].id, :screen_id => theatres.last.screens[1].id, :start_time=> "10:15:00" },
    {:movie_id => movies[2].id, :screen_id => theatres.last.screens[2].id, :start_time=> "11:15:00" },
    {:movie_id => movies[3].id, :screen_id => theatres.last.screens[3].id, :start_time=> "11:30:00" }
])

showtimes.each do |showtime|
  60.times { |i| Ticket.create(:showtime_id => showtime.id, :email => "customer#{1}@example.com", :seats => ((i % 2)+1).to_i ) }
end
