require_relative '../spec_helper'

describe GameOfLife do

  describe 'dead cell' do

    context 'with no neighbours' do

      let(:current_gen) { <<-GEN.gsub(' ','')
        ---
        ---
        ---
        GEN
      }

      let(:next_gen) { <<-GEN.gsub(' ','').chomp("\n")
        ---
        ---
        ---
        GEN
      }

      it 'stays dead' do
        expect(GameOfLife.next_generation(current_gen)).to eq(next_gen)
      end

    end

    context 'with 3 neighbours' do

      let(:current_gen) { <<-GEN.gsub(' ','')
        -*-
        **-
        ---
        GEN
      }

      let(:next_gen) { <<-GEN.gsub(' ','').chomp("\n")
        **-
        **-
        ---
        GEN
      }

      it 'comes alive' do
        expect(GameOfLife.next_generation(current_gen)).to eq(next_gen)
      end

    end

  end

  describe 'live cell' do

    context 'with 1 neighbour' do

      let(:current_gen) { <<-GEN.gsub(' ','')
        -*-
        -*-
        ---
        GEN
      }

      let(:next_gen) { <<-GEN.gsub(' ','').chomp("\n")
        ---
        ---
        ---
        GEN
      }

      it 'dies' do
        expect(GameOfLife.next_generation(current_gen)).to eq(next_gen)
      end

    end

    context 'with 2 neighbours' do

      let(:current_gen) { <<-GEN.gsub(' ','')
        -**
        -*-
        ---
        GEN
      }

      let(:next_gen) { <<-GEN.gsub(' ','').chomp("\n")
        -**
        -**
        ---
        GEN
      }

      it 'lives' do
        expect(GameOfLife.next_generation(current_gen)).to eq(next_gen)
      end

    end

    context 'with 3 neighbours' do

      let(:current_gen) { <<-GEN.gsub(' ','')
        ***
        -*-
        ---
        GEN
      }

      let(:next_gen) { <<-GEN.gsub(' ','').chomp("\n")
        ***
        ***
        ---
        GEN
      }

      it 'lives' do
        expect(GameOfLife.next_generation(current_gen)).to eq(next_gen)
      end

    end

  end

end
