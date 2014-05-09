require 'rspec'
require 'cell'

describe Cell do

describe 'is alive' do

  context 'with one neighbour' do

    it 'dies' do
      cell = Cell.new(true, 1)
      cell = cell.next_generation
      expect(cell.alive?).to be_false
    end

  end

  context 'with more than three neighbours' do

    it 'dies' do
      cell = Cell.new(true, 4)
      cell = cell.next_generation
      expect(cell.alive?).to be_false
    end

  end

  context 'with two neighbours' do

    it 'stays alive' do
      cell = Cell.new(true, 2)
      cell = cell.next_generation
      expect(cell.alive?).to be_true
    end

  end

  context 'with three neighbours' do

    it 'stays alive' do
      cell = Cell.new(true, 3)
      cell = cell.next_generation
      expect(cell.alive?).to be_true
    end

  end

end

describe 'cell is dead' do

  context 'with not 3 neighbours' do

    it 'stays dead' do
      cell = Cell.new(false, 1)
      cell = cell.next_generation
      expect(cell.alive?).to be_false
    end

  end

  context 'with three live neighbours' do

    it 'becomes alive' do
      cell = Cell.new(true, 3)
      cell = cell.next_generation
      expect(cell.alive?).to be_true
    end

  end

end

end
