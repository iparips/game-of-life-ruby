require_relative '../spec_helper'

describe Io do

  describe '.string_to_arr' do

    let(:string) { "--\n-*" }

    subject { Io.string_to_arr(string) }

    it 'converts to grid' do
      expect(subject).to eq [
        [false, false],
        [false, true]
      ]
    end

  end

  describe '.arr_to_string' do

    let(:grid) {[
        [true, false],
        [false, true]
      ]}

      subject { Io.arr_to_string(grid) }

    it 'converts to string' do
      expect(subject).to eq "*-\n-*"
    end

  end

end
