module NeighboursCalc

  class << self

    def calc(matrix, x, y)
      neighbours = 0
      neighbours +=1 if alive?(matrix, x, y-1)
      neighbours +=1 if alive?(matrix, x+1, y-1)
      neighbours +=1 if alive?(matrix, x+1, y)
      neighbours +=1 if alive?(matrix, x+1, y+1)
      neighbours +=1 if alive?(matrix, x, y+1)
      neighbours +=1 if alive?(matrix, x-1, y+1)
      neighbours +=1 if alive?(matrix, x-1, y)
      neighbours +=1 if alive?(matrix, x-1, y-1)
      neighbours
    end

    private

    def alive?(matrix, x, y)
      within_boundary?(matrix, x, y) && matrix[y, x].alive?
    end

    def within_boundary?(matrix, x, y)
      ( x >= 0 && x < matrix.column_count ) && ( y >= 0 && y < matrix.row_count )
    end

  end

end
