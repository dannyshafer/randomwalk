class WelcomeController < ApplicationController

	def get_directions
		@destination_lon, @destination_lat = get_destination(params[:lon], params[:lat], params[:distance])
		# @directions = HTTParty.get("https://api.mapbox.com/v4/directions/mapbox.walking/#{params[:lon]},#{params[:lat]};#{@destination_lon},#{@destination_lat}.json?access_token=pk.eyJ1IjoicmFuZG9td2FsayIsImEiOiJjaWw0Y3B5dzEwMjl1dGhseXcyOWh5NGJpIn0.ZKl7LVbPulKaAqQjbsMJfQ")
	end

	private

	def get_destination(lon, lat, miles)
		miles = miles.to_f
		lon = lon.to_f
		lat = lat.to_f
		direction = [1,2,3,4].sample
		case direction
		when 1 #north
			while miles > 1
				lon += 0.01452156831
				miles -= 1
			end
			while miles > 0
				lon += 0.00145215683
				miles -= 0.1
			end
		when 2 #south
			while miles > 1
				lon -= 0.01452156831
				miles -= 1
			end
			while miles > 0
				lon -= 0.00145215683
				miles -= 0.1
			end
		when 3 #east
			while miles > 1
				lat += 0.01452156831
				miles -= 1
			end
			while miles > 0
				lat += 0.00145215683
				miles -= 0.1
			end
		when 4 #west
			while miles > 1
				lat -= 0.01452156831
				miles -= 1
			end
			while miles > 0
				lat -= 0.00145215683
				miles -= 0.1
			end
		end
		return lon, lat
	end
end