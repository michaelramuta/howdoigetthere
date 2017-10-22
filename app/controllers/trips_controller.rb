require 'net/http'
require 'json'

class TripsController < ApplicationController

	def index
		json_response('test')
	end
end
