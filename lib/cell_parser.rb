module CellParser

  class << self

    def parse grid_string
      lines = grid_string.split("\n")
      lines.map { |line| parse_line(line) }.flatten
    end

    def parse_line line
      cells = line.split(//)
      cells.map { |cell| parse_cell(cell) }
    end

    def parse_cell cell_string
      Cell.new(cell_string == '*')
    end

  end

end
