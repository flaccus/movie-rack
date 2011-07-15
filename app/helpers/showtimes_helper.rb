module ShowtimesHelper

  def showtime_filter_options
    (10..20).each.inject([]) do |options,i|
      ["00","15","30","45"].each {|m| options << "#{i}:#{m}" }
      options
    end.unshift ""
  end
end
