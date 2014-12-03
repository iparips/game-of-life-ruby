class NeighboursCounter

  # x, y -> coordinates of the current cell
  def count(x, y, all_cells)
    neighbours = 0
    neighbours+=1 if alive?( x-1, y-1, all_cells )
    neighbours+=1 if alive?( x,   y-1, all_cells )
    neighbours+=1 if alive?( x+1, y-1, all_cells )
    neighbours+=1 if alive?( x-1, y,   all_cells )
    neighbours+=1 if alive?( x+1, y,   all_cells )
    neighbours+=1 if alive?( x-1, y+1, all_cells )
    neighbours+=1 if alive?( x,   y+1, all_cells )
    neighbours+=1 if alive?( x+1, y+1, all_cells )
    neighbours
  end

  private

  def alive?(x, y, all_cells)
    within_bounds?(x, y, all_cells) ? all_cells[y][x] : false
  end

  def within_bounds?(x, y, all_cells)
    x >= 0 && y >= 0 && y < all_cells.size && x < all_cells.first.size
  end

end
