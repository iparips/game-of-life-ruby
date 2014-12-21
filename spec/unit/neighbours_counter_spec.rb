require 'neighbours_counter'

describe NeighboursCounter do

  context 'one live neighbour' do

    let(:cells) {[
      [false, true, false],
      [false, false, false],
      [false, false, false],
    ]}

    it 'counts' do
      expect(subject.count(0, 0, cells)).to eq(1)
    end

  end

  context 'two live neighbours' do

    let(:cells) {[
      [true, true, false],
      [false, true, false],
      [false, false, false],
    ]}

    it 'counts' do
      expect(subject.count(0, 0, cells)).to eq(2)
    end

  end

  context 'three live neighbours' do
    let(:cells) {[
      [true, true, false],
      [true, false, false],
      [false, false, false],
    ]}

    it 'counts' do
      expect(subject.count(1, 1, cells)).to eq(3)
    end
  end

  context 'all cells live on x axis' do

    let(:cells) {[
      [true, true, true],
      [false, false, false],
      [false, false, false],
    ]}

    it 'does not count a non adjacent cell' do
      expect(subject.count(0, 0, cells)).to eq(1)
    end

  end

  context 'all cells live on y axis' do

    let(:cells) {[
      [false, true, false],
      [false, true, false],
      [false, true, false],
    ]}

    it 'does not count a non adjacent cell' do
      expect(subject.count(1, 2, cells)).to eq(1)
    end

  end

  context 'row length is not same as column length' do

    let(:cells) {[
      [false, true, false],
      [false, true, false]
    ]}

    it 'does not count a non adjacent cell' do
      expect(subject.count(2, 1, cells)).to eq(2)
    end

  end

end
