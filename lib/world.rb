class World

	def initialize(cells, neighbours_counter, dead_or_alive)
		@cells = cells
		@dead_or_alive = dead_or_alive
		@neighbours_counter = neighbours_counter
	end

	def next_iteration
		@cells.map do |row|
			row.map do |cell|
				neighbours_count = @neighbours_counter.count(cell)
				@dead_or_alive.decide(cell, neighbours_count)
			end
		end
	end
end
