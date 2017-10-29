require 'rest-client'
require 'json'

class DistanceService
  attr_accessor :distance, :time

  def initialize(stats)
    url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=' + stats[:start_lat] + ',' + stats[:start_lon] + '&destinations=' + stats[:end_lat] + ',' + stats[:end_lon] + '&key=' + ENV['GOOGLE_MAPS_KEY']
    response = JSON.parse(RestClient.get(url))
  end
end