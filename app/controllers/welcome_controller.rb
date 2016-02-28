class WelcomeController < ApplicationController

	def get_directions
		path = get_compass_path
		params[:distance] = params[:distance].to_f*0.78 
		distance_per_segment = params[:distance] / 4
		waypoints = [[params[:lon], params[:lat]]]
		current_waypoint_index = 0
		
		path.each do |segment|
			@destination_lon, @destination_lat = get_destination(waypoints[current_waypoint_index][0], waypoints[current_waypoint_index][1], distance_per_segment, segment)
			waypoints << [@destination_lon, @destination_lat]
			current_waypoint_index += 1
		end

		waypoints.join(";")

		@exported_waypoints = waypoints
	end

	private

	def get_destination(lon, lat, miles, cardinal_direction)
		miles = miles.to_f
		lon = lon.to_f
		lat = lat.to_f
		direction = cardinal_direction
		case direction
		when 1 #north
			while miles > 1
				lon += 0.01452156831
				miles -= 1
			end
			while miles > 0.1
				lon += 0.00145215683
				miles -= 0.1
			end
			while miles > 0
				lon += 0.000145215683
				miles -= 0.01
			end
		when 2 #south
			while miles > 1
				lon -= 0.01452156831
				miles -= 1
			end
			while miles > 0.1
				lon -= 0.00145215683
				miles -= 0.1
			end
			while miles > 0
				lon -= 0.000145215683
				miles -= 0.01
			end
		when 3 #east
			while miles > 1
				lat += 0.01452156831
				miles -= 1
			end
			while miles > 0.1
				lat += 0.00145215683
				miles -= 0.1
			end
			while miles > 0
				lat += 0.000145215683
				miles -= 0.01
			end
		when 4 #west
			while miles > 1
				lat -= 0.01452156831
				miles -= 1
			end
			while miles > 0.1
				lat -= 0.00145215683
				miles -= 0.1
			end
			while miles > 0
				lat -= 0.000145215683
				miles -= 0.01
			end
		end
		return lon, lat
	end

	def get_compass_path
		# north = 1, south = 2, east = 3, west = 4
		first_direction = [1,2,3,4].sample
		case first_direction 
		when 1
			second_direction = [3,4].sample
			third_direction = 2
		when 2
			second_direction = [3,4].sample
			third_direction = 1
		when 3
			second_direction = [1,2].sample
			third_direction = 4
		when 4
			second_direction = [1,2].sample
			third_direction = 3
		end
		return [first_direction, second_direction, third_direction]
	end
end