require 'spec_helper'

RSpec.describe do
    before do 
        @board = Board.new

    end

    describe '#initialize' do
        it 'exist' do
            expect(@board).to be_a(Board)
        end

        it 'has a hash containing 7 keys' do

            expect(@board.columns).to be_a(Hash)
            expect(@board.columns.keys.length).to eq(7)
        end

        it 'has 7 column keys in, each contains an empty array' do

            expect(@board.columns[:a]).to eq([])
            expect(@board.columns[:b]).to eq([])
            expect(@board.columns[:c]).to eq([])
            expect(@board.columns[:d]).to eq([])
            expect(@board.columns[:e]).to eq([])
            expect(@board.columns[:f]).to eq([])
            expect(@board.columns[:g]).to eq([])

        end
    end

    describe '#populate_columns' do
        it 'fills each column with 6 new cell objects' do
            
            @board.populate_columns

            expect(@board.columns[:a][0]).to be_a(Cell)
            expect(@board.columns[:a][5]).to be_a(Cell)
            expect(@board.columns[:a].length).to eq(6)

            expect(@board.columns[:b][0]).to be_a(Cell)
            expect(@board.columns[:b][5]).to be_a(Cell)
            expect(@board.columns[:b].length).to eq(6)

            expect(@board.columns[:c][0]).to be_a(Cell)
            expect(@board.columns[:c][5]).to be_a(Cell)
            expect(@board.columns[:c].length).to eq(6)

            expect(@board.columns[:d][0]).to be_a(Cell)
            expect(@board.columns[:d][5]).to be_a(Cell)
            expect(@board.columns[:d].length).to eq(6)

            expect(@board.columns[:e][0]).to be_a(Cell)
            expect(@board.columns[:e][5]).to be_a(Cell)
            expect(@board.columns[:e].length).to eq(6)

            expect(@board.columns[:f][0]).to be_a(Cell)
            expect(@board.columns[:f][5]).to be_a(Cell)
            expect(@board.columns[:f].length).to eq(6)

            expect(@board.columns[:g][0]).to be_a(Cell)
            expect(@board.columns[:g][5]).to be_a(Cell)
            expect(@board.columns[:g].length).to eq(6)
    
        end
    end

    describe '#add_piece' do
        it 'takes a player and column argument' do

            @board.populate_columns
            @board.add_piece(:ply_1, :a)
        end

        it 'adds a piece to the top of the @board by changing the first cell to player' do

            @board.populate_columns
            
            expect(@board.columns[:a][0].ply_1?).to eq(false)
            @board.add_piece(:ply_1, :a)
            expect(@board.columns[:a][0].ply_1?).to eq(true)
            expect(@board.columns[:a][1].ply_1?).to eq(false)
            expect(@board.columns[:b][0].ply_1?).to eq(false)

            @board.add_piece(:ply_1, :b)
            expect(@board.columns[:b][0].ply_1?).to eq(true)
            expect(@board.columns[:b][1].ply_1?).to eq(false)

        end

        it 'adds a new piece ontop of the old piece' do


            @board.populate_columns

            expect(@board.columns[:a][0].ply_1?).to eq(false)
            @board.add_piece(:ply_1, :a)
            expect(@board.columns[:a][0].ply_1?).to eq(true)
            expect(@board.columns[:a][1].ply_1?).to eq(false)
            expect(@board.columns[:b][0].ply_1?).to eq(false)
            
            @board.add_piece(:ply_1, :a)
            expect(@board.columns[:a][0].ply_1?).to eq(true)
            expect(@board.columns[:a][1].ply_1?).to eq(true)
            expect(@board.columns[:a][2].ply_1?).to eq(false)
            expect(@board.columns[:b][0].ply_1?).to eq(false)


            @board.add_piece(:ply_1, :b)
            expect(@board.columns[:b][0].ply_1?).to eq(true)
            expect(@board.columns[:b][1].ply_1?).to eq(false)
            expect(@board.columns[:a][0].ply_1?).to eq(true)
            expect(@board.columns[:a][1].ply_1?).to eq(true)
            expect(@board.columns[:a][2].ply_1?).to eq(false)
            expect(@board.columns[:c][0].ply_1?).to eq(false)

            @board.add_piece(:ply_1, :b)
            expect(@board.columns[:b][0].ply_1?).to eq(true)
            expect(@board.columns[:b][1].ply_1?).to eq(true)
            expect(@board.columns[:b][2].ply_1?).to eq(false)
            expect(@board.columns[:a][0].ply_1?).to eq(true)
            expect(@board.columns[:a][1].ply_1?).to eq(true)
            expect(@board.columns[:a][2].ply_1?).to eq(false)
            expect(@board.columns[:c][0].ply_1?).to eq(false)
        end

        it 'uses the player argument to set the piece to the current player' do

            @board.populate_columns

            expect(@board.columns[:a][0].ply_2?).to eq(false)
            @board.add_piece(:ply_2, :a)
            expect(@board.columns[:a][0].ply_2?).to eq(true)
            expect(@board.columns[:a][1].ply_2?).to eq(false)
            expect(@board.columns[:b][0].ply_2?).to eq(false)
            
            @board.add_piece(:ply_2, :a)
            expect(@board.columns[:a][0].ply_2?).to eq(true)
            expect(@board.columns[:a][1].ply_2?).to eq(true)
            expect(@board.columns[:a][2].ply_2?).to eq(false)
            expect(@board.columns[:b][0].ply_2?).to eq(false)


            @board.add_piece(:ply_2, :b)
            expect(@board.columns[:b][0].ply_2?).to eq(true)
            expect(@board.columns[:b][1].ply_2?).to eq(false)
            expect(@board.columns[:a][0].ply_2?).to eq(true)
            expect(@board.columns[:a][1].ply_2?).to eq(true)
            expect(@board.columns[:a][2].ply_2?).to eq(false)
            expect(@board.columns[:c][0].ply_2?).to eq(false)

            @board.add_piece(:ply_2, :b)
            expect(@board.columns[:b][0].ply_2?).to eq(true)
            expect(@board.columns[:b][1].ply_2?).to eq(true)
            expect(@board.columns[:b][2].ply_2?).to eq(false)
            expect(@board.columns[:a][0].ply_2?).to eq(true)
            expect(@board.columns[:a][1].ply_2?).to eq(true)
            expect(@board.columns[:a][2].ply_2?).to eq(false)
            expect(@board.columns[:c][0].ply_2?).to eq(false)
        end
    end
end