class Trip < ApplicationRecord
	attr_accessor :transports, :stats

	def initialize(params={})
		start_lat = params.fetch(:start_lat, nil)
	    start_lon = params.fetch(:start_lon, nil)
	    end_lat = params.fetch(:end_lat, nil)
	    end_lon = params.fetch(:end_lon, nil)
	    @transports = { cta: 1, rideshare: 1, walking: 1, bike: 1}
	    @stats = { temp: nil, distance: nil, time: nil, trip_time: nil, price: nil, rain: nil}
	end

	def transport_mode
		@transports.sort_by{|k,v| v }.last[0]
	end
end
