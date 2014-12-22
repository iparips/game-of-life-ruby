class NeighboursCounter

  # x, y -> coordinates of the current cell
  def count(x, y, all_cells)
    neighbours = 0

    (x-1..x+1).each do |i|
      (y-1..y+1).each do |j|
        neighbours +=1 if alive?(i, j, all_cells) unless i == x && j == y
      end
    end

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
