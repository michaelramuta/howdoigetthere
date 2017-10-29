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

	def add_modifiers
		time_modifier
		temp_modifier
	end

	def transport_mode
		@transports.sort_by{|k,v| v }.last[0]
	end

	def modify_stat(key, modifier)
		@transports[key] *= modifier
	end

	def time_modifier
		time = Time.now.hour
		@stats[:time] = time
		if time.between?(0, 5)
			modify_stat(:walking, 0.8)
			modify_stat(:bike, 0.2)
			modify_stat(:rideshare, 1.6)
		elsif time.between?(5, 9)
			modify_stat(:walking, 1.4)
			modify_stat(:bike, 1.2)
			modify_stat(:cta, 0.8)
		elsif time.between?(9, 13)
			modify_stat(:walking, 1.4)
			modify_stat(:bike, 1.4)
		elsif time.between?(17, 19)
			modify_stat(:walking, 1.4)
			modify_stat(:bike, 1.4)
			modify_stat(:cta, 0.8)
		elsif time.between?(19, 22)
			modify_stat(:walking, 1.4)
			modify_stat(:rideshare, 1.1)
			modify_stat(:cta, 1.4)
		elsif time.between?(22, 23)
			modify_stat(:walking, 0.8)
			modify_stat(:bike, 0.2)
			modify_stat(:rideshare, 1.6)
		end
	end

	def temp_modifier
	end
end
