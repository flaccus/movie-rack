require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ShowtimesHelper. For example:
#
# describe ShowtimesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ShowtimesHelper do
  it "should provide a list for filtering showtimes" do
    options = helper.showtime_filter_options
    options.length.should == 45
    options[0].should be_empty
    options[1].should == "10:00"
    options[-1].should == "20:45"
  end
end
