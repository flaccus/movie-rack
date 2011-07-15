class Screen < ActiveRecord::Base
  belongs_to :theater
  has_many :showtimes

  def cheap_seats
    (seating_capacity / 10)
  end
end
