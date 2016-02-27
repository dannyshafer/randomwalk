class WelcomeController < ApplicationController

	def get_directions
		#api calls for getting directions goes here
		destination_lon, destination_lat = get_destination(params[:lon], params[:lat])
		directions = HTTParty.get("https://api.mapbox.com/v4/directions/mapbox.walking/#{params[:lon]},#{params[:lat]};#{destination_lon},#{destination_lat}.json?access_token=pk.eyJ1IjoicmFuZG9td2FsayIsImEiOiJjaWw0Y3B5dzEwMjl1dGhseXcyOWh5NGJpIn0.ZKl7LVbPulKaAqQjbsMJfQ")
	end

	private

	def get_destination(lon, lat)
		return -122.419416, 37.774929
	end
end
