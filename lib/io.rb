module Io

  class << self

    def string_to_grid string
      lines = string.split("\n")
      grid_of_chars = lines.map(&:chars)
      grid_of_chars.map do |line|
        line.map { |c| c == '*' }
      end
    end

    def grid_to_string grid
      grid_of_chars = grid.map do |line|
        line.map { |c| c == true ? '*' : '-' }
      end

      grid_of_chars.map { |line| line.join('') }.join "\n"
    end

  end

end
