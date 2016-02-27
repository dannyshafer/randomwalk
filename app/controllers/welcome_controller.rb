class WelcomeController < ApplicationController

	def get_directions
		#api calls for getting directions goes here
		@destination_lon, @destination_lat = get_destination(params[:lon], params[:lat], params[:distance])
		@directions = HTTParty.get("https://api.mapbox.com/v4/directions/mapbox.walking/#{params[:lon]},#{params[:lat]};#{@destination_lon},#{@destination_lat}.json?access_token=pk.eyJ1IjoicmFuZG9td2FsayIsImEiOiJjaWw0Y3B5dzEwMjl1dGhseXcyOWh5NGJpIn0.ZKl7LVbPulKaAqQjbsMJfQ")
	end

	private

	def get_destination(lon, lat, miles)
		#randomizes which compass direction
		miles = miles.to_f
		lon = lon.to_f
		lat = lat.to_f
		while miles > 1
			lat += 0.01452156831
			miles -= 1
		end
		while miles > 0
			lat += 0.00145215683
			miles -= 0.1
		end
		return lon, lat
	end
end
