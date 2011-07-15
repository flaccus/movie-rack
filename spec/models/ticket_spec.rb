require 'spec_helper'

describe Ticket do
  it "should belong to a showtime" do
    t = Ticket.first
    t.showtime.should eq(Showtime.where("id = ?", t.showtime_id).first)
  end
end
