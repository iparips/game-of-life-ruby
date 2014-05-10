require 'rspec'
require 'game'

describe Game do

# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

  context 'empty game' do
    it "stays empty" do
      game = Game.create(<<-GOL)
----
----
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
----
----
----
      GOL
    end
  end

  context 'live cell with fewer than two live neighbours' do
    it "dies" do
      game = Game.create(<<-GOL)
-**-
----
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
----
----
----
      GOL
    end
  end

  context 'live cell with two live neighbours' do
    it "lives on" do
      game = Game.create(<<-GOL)
***-
----
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
-*--
-*--
----
      GOL
    end
  end

  context 'live cell with three live neighbours' do
    it "lives on" do
      game = Game.create(<<-GOL)
-**-
-**-
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
-**-
-**-
----
      GOL
    end
  end

  context 'dead cell with 3 neighbours' do
    it "comes alive" do
      game = Game.create(<<-GOL)
-*--
-**-
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
-**-
-**-
----
      GOL
    end
  end

  context 'live cell with more than 3 neighbours' do
    it "dies" do
      game = Game.create(<<-GOL)
***-
-**-
----
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
*-*-
*-*-
----
      GOL
    end
  end

end
