class Cell
  def initialize(alive, neighbours)
    @alive, @neighbours = alive, neighbours
  end

  def next_generation
    alive = (@neighbours == 3) || (@alive && @neighbours == 2)
    Cell.new(alive, @neighbours)
  end

  def alive?
     @alive
  end
end
