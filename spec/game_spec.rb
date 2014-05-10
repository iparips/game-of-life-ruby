require 'rspec'
require 'game'

describe Game do

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

  context 'stable square' do
    it "stays square" do
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

end
