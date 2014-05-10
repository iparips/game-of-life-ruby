require 'matrix'
require 'cell'

module Parser

  class << self

    def parse grid_string
      lines = grid_string.split("\n")

      grid = Array.new(lines.count) { Array.new }

      lines.each_with_index do |line, i|
        grid[i] = parse_line(line)
      end
      grid
    end

    private

    def parse_line line
      cells = line.split(//)
      cells.map { |cell| parse_cell(cell) }
    end

    def parse_cell cell_string
      Cell.new(cell_string == '*')
    end

  end

end
