class DeadOrAlive

  def lives?(alive, neighbours_count)
    neighbours_count == 3 || alive && neighbours_count == 2
  end

end
