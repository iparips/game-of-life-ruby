class World

	def initialize(neighbours_counter, dead_or_alive)
		@dead_or_alive = dead_or_alive
		@neighbours_counter = neighbours_counter
	end

	def next_iteration(cells)
		cells.map.with_index do |row, y|
			row.map.with_index do |cell, x|
				neighbours_count = @neighbours_counter.count(x, y, cell)
				@dead_or_alive.lives?(cell, neighbours_count)
			end
		end
	end
end
