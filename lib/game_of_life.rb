require 'grid'
require 'neighbours_counter'
require 'dead_or_alive'
require 'io'

module GameOfLife

  class << self

    def next_generation(init_state_string)

      g = Grid.new(NeighboursCounter.new, DeadOrAlive.new)

      cells = Io.string_to_arr(init_state_string)
      new_gen_cells = g.next_iteration cells
      Io.arr_to_string(new_gen_cells)

    end

  end

end
