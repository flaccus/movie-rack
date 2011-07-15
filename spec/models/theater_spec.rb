require 'spec_helper'

describe Theater do
  it "should have some screens" do
    t = Theater.find(:first)
    t.screens.should_not be_empty
    t.screens.length.should eq(5)
  end
end

