require 'net/http'
require 'json'

class TripsController < ApplicationController

	def index
		trip = Trip.new()
		trip.add_modifiers
		json_response(trip.transport_mode)
	end
end
