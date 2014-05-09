require 'cell_parser'

class Game

  def self.create(width, init_state)
    cells = CellParser.parse(init_state)
    Game.new(width, cells)
  end

  def initialize(width, cells)
    @width, @cells = width, cells
  end

  def next_generation
    next_gen_cells = @cells.map do |cell|
      cell.next_generation(calc_neighbours(cell))
    end

    @cells = next_gen_cells
  end

  def to_s
    CellParser.render(@width, @cells)
  end

  private

  def calc_neighbours(cell)
    0
  end

end
