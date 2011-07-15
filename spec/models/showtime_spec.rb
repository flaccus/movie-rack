require 'spec_helper'

describe Showtime do
  it "should provide scope for filtering" do
    Showtime.respond_to?(:filtered).should be_true
    Showtime.filtered("10:15").length.should eq(4)
  end

  it "should provide access for determining seat availability" do
    showtime = Showtime.first
    showtime.respond_to?(:available_seats).should be_true
    showtime.available_seats.should eq(30)
  end
end
