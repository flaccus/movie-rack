class Ticket < ActiveRecord::Base
  belongs_to :showtime
  
  validates :email,
            :presence => true,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :seats,
            :presence => true,
            :numericality => true,
            :seat_capacity => true
  
end
