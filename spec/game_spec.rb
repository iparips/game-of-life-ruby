require 'rspec'
require 'game'

describe Game do

  context 'empty game' do
    it "stays empty" do
      game = Game.create(3, <<-GOL)
---
---
---
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
---
---
---
      GOL
    end
  end

  context 'stable square' do
    it "stays square" do
      game = Game.create(3, <<-GOL)
-**
-**
---
      GOL

      game.next_generation
      expect(game.to_s).to eq(<<-GOL)
-**
-**
---
      GOL
    end
  end

end
