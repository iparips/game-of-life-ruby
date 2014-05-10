require 'matrix'
require 'cell'

module Parser

  class << self

    def parse grid_string
      lines = grid_string.split("\n")
      grid = Matrix[]
      lines.each do |line|
        grid = Matrix.rows(grid.to_a << parse_line(line))
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
