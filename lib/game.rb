require 'parser'
require 'renderer'
require 'neighbours'

class Game

  def self.create(width, init_state)
    cells = Parser.parse(init_state)
    Game.new(width, cells)
  end

  def initialize(width, cells)
    @width, @cells = width, cells
  end

  def next_generation

    new_cells = Array.new(@cells.size) { Array.new }

    @cells.each_with_index do |cell, row, col|
      neighbours = Neighbours.calc_alive(@cells, col, row)
      new_cell = cell.next_generation(neighbours)
      puts "col:#{col}, row:#{row}"
      new_cells[row][col] = new_cell
    end

    @cells = new_cells

  end

  def to_s
    Renderer.render(@width, @cells)
  end

  private

  def process_row(row)

  end

  def calc_neighbours(cell)
    Neighbours.calc_alive(@cells, cell)
  end

end
