class Cell

  def self.live
    Cell.new(true)
  end

  def self.dead
    Cell.new(false)
  end

  def initialize(alive)
    @alive = alive
  end

  def next_generation(neighbours)
    alive = (neighbours == 3) || (@alive && neighbours == 2)
    Cell.new(alive)
  end

  def alive?
     @alive
  end
end
