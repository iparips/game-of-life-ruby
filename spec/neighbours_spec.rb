require 'matrix'
require 'neighbours'

describe Neighbours do

  cells = nil
  subject { Neighbours.calc_alive(cells, 1, 1) }

  it "no live neighbours" do
    cells = Matrix[
                   [Cell.dead, Cell.dead, Cell.dead],
                   [Cell.dead, Cell.dead, Cell.dead],
                   [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(0)
  end

  it "live neighbour at 12 o'clock" do
    cells = Matrix[
                    [Cell.dead, Cell.live, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 1:30" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.live],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 3" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.live],
                    [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 4:30" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.live]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 6" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.live, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 7:30" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.live, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 9" do
    cells = Matrix[
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.live, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

  it "live neighbour at 10:30" do
    cells = Matrix[
                    [Cell.live, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead],
                    [Cell.dead, Cell.dead, Cell.dead]
                 ]

    expect(subject).to eq(1)
  end

end
