class Showtime < ActiveRecord::Base
  belongs_to :screen
  belongs_to :movie
  has_many :tickets

  scope :index, joins(:screen,:movie).order('screens.theater_id, showtimes.screen_id, movies.title ASC, showtimes.start_time ASC')

  scope :filtered, lambda { |time|
      parsed_time = Time.parse("2000-01-01 #{time}:00 UTC")
      joins(:screen,:movie).
      where("showtimes.start_time >= ? AND showtimes.start_time <= ? ", parsed_time - 20.minutes, parsed_time + 20.minutes).
      order('screens.theater_id, showtimes.screen_id, movies.title ASC, showtimes.start_time ASC')
    }

  def available_seats
    screen.seating_capacity - tickets.sum(:seats)
  end

  
end
