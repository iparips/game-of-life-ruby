module Neighbours

  class << self

    def calc_alive(cells, x, y)
      neighbours = 0
      neighbours +=1 if alive?(cells, x, y-1)
      neighbours +=1 if alive?(cells, x+1, y-1)
      neighbours +=1 if alive?(cells, x+1, y)
      neighbours +=1 if alive?(cells, x+1, y+1)
      neighbours +=1 if alive?(cells, x, y+1)
      neighbours +=1 if alive?(cells, x-1, y+1)
      neighbours +=1 if alive?(cells, x-1, y)
      neighbours +=1 if alive?(cells, x-1, y-1)
      neighbours
    end

    private

    def alive?(cells, x, y)
      within_boundary?(cells, x, y) && cells[y][x].alive?
    end

    def within_boundary?(cells, x, y)
      ( x >= 0 && x < cells.first.size ) && ( y >= 0 && y < cells.size )
    end

  end

end
