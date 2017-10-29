require 'rest-client'
require 'json'

class TempService
  attr_accessor :rain, :temp

  def initialize(stats)
    url = 'https://api.darksky.net/forecast/' + ENV['DARK_SKY_KEY'] + '/' + stats[:start_lat]  + ',' + stats[:start_lon]
    response = JSON.parse(RestClient.get(url))
    @rain = response['currently']['precipIntensity']
    @temp = response['currently']['apparentTemperature']
  end
end