require 'spec_helper'

RSpec.describe do
    before do 
        @board = Board.new
    end

    desicribe '#initialize' do
        it 'exist' do
            expect(@board).to be_a(Board)
        end

        it 'has 7 column attributes, each contains an empty array' do

            expect(@board.col_a).to eq([])
            expect(@board.col_b).to eq([])
            expect(@board.col_c).to eq([])
            expect(@board.col_d).to eq([])
            expect(@board.col_e).to eq([])
            expect(@board.col_f).to eq([])
            expect(@board.col_g).to eq([])

        end
    end
end