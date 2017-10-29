require 'net/http'
require 'json'

class TripsController < ApplicationController

	def index
		trip = Trip.new()
		json_response(trip.transport_mode)
	end
end
