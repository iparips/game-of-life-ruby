require 'cell'

module CellParser

  class << self

    def parse grid_string
      lines = grid_string.split("\n")
      lines.map { |line| parse_line(line) }.flatten
    end

    def render(width = nil, cells)
      width ||= cells.size
      string = ''

      cells.each_with_index do |cell, index|
        string += "\n" if index != 0 && index % width == 0
        string += render_single(cell)
      end

      string
    end

    def render_single cell
      cell.alive? ? '*' : '-'
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
