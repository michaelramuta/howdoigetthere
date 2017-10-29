require 'net/http'
require 'json'

class TripsController < ApplicationController

	def index
    start_lat = params[:start_lat].present? ? params[:start_lat] : '41.910402'
    start_lon = params[:start_lon].present? ? params[:start_lon] : '-87.701357'
    end_lat = params[:end_lat].present? ? params[:end_lat] : '41.894067'
    end_lon = params[:end_lon].present? ? params[:end_lon] : '-87.621702'
		trip = Trip.new({start_lat: start_lat, start_lon: start_lon, end_lat: end_lat, end_lon: end_lon})
		trip.add_modifiers
		json_response(trip.transport_mode)
	end
end
