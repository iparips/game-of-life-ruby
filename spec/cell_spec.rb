require 'rspec'
require 'cell'

describe Cell do

  [
    { alive: true, neighbours: 1, next_gen_alive: false },
    { alive: true, neighbours: 2, next_gen_alive: true },
    { alive: true, neighbours: 3, next_gen_alive: true },
    { alive: true, neighbours: 4, next_gen_alive: false },
    { alive: false, neighbours: 1, next_gen_alive: false },
    { alive: false, neighbours: 3, next_gen_alive: true },
  ].each do |rule|

    dead_or_alive_now = rule[:alive] ? 'alive' : 'dead'
    neighbours = rule[:neighbours]
    live_or_die = rule[:next_gen_alive] ? 'live' : 'die'

    it "that is #{dead_or_alive_now} with #{rule[:neighbours]} neighbours should #{live_or_die}" do
      cell = Cell.new(dead_or_alive_now)
      cell = cell.next_generation(neighbours)
      expect(cell.alive?).to be(rule[:next_gen_alive])
    end

  end

end
