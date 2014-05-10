require 'matrix'
require 'cell'

module Renderer

  class << self

    def render(width = nil, cells)
      cells.to_a.map { |row| render_row(row) + "\n" }.join
    end

    def render_single(cell)
      cell.alive? ? '*' : '-'
    end

    private

    def render_row(row)
      row.map { |cell| render_single(cell) }.join
    end

  end

end
