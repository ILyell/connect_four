require 'spec_helper'

RSpec.describe do
    before do 
        @board = Board.new

    end

    describe '#initialize' do
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

    describe '#populate' do
        it 'fills each column with 6 new cell objects' do
            
            @board.populate

            expect(@board.col_a).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])

            expect(@board.col_b).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])
            expect(@board.col_c).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])
            expect(@board.col_d).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])
            expect(@board.col_e).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])
            expect(@board.col_f).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])
            expect(@board.col_g).to be_a([Cell, Cell, Cell, Cell, Cell , Cell])

            
        end
    end
end