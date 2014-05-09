class Game

  def create init_state
    lines = init_state.split("\n")
    lines.map do |line|
      cells = line.split(//)
      cells.map do |cell|
        Cell.new(alive: parse_alive)
      end
    end.flatten
  end

  def initialise init_state
  end

  def next_generation
  end

  def to_s
  end

  private

  def parse_alive cell_string
    cell_string == '*'
  end



end
