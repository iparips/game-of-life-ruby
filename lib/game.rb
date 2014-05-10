require 'parser'
require 'renderer'
require 'neighbours'

class Game

  def self.create(init_state)
    cells = Parser.parse(init_state)
    Game.new(cells)
  end

  def initialize(cells)
    @cells = cells
  end

  def next_generation

    # y comes first in a 2d array
    new_cells = Array.new(@cells.size) { Array.new }

    @cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        neighbours = Neighbours.calc_alive(@cells, x, y)
        new_cell = cell.next_generation(neighbours)
        new_cells[y][x] = new_cell
      end
    end

    @cells = new_cells

  end

  def to_s
    Renderer.render(@cells)
  end

  private

  def calc_neighbours(cell)
    Neighbours.calc_alive(@cells, cell)
  end

end
