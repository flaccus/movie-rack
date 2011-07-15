class SeatCapacityValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value && value <= object.showtime.available_seats
      object.errors[attribute] << [(options[:message] || "exceeds number of tickets available #{object.showtime.available_seats}" )]
    end
  end
end
