require 'spec_helper'

RSpec.describe CPU do
    include CPU
    before(:each) do

        @player_1 = Player.new("Tim", :ply_1)
        @player_2 = Player.new("CPU", :ply_2, true)
    end

    describe '#cpu_turn' do
        it 'places a random move if no win' do

            board_1 = Board.new
            board_1.populate_columns
            board_2 = Board.new
            board_2.populate_columns

            board_1.add_piece(:ply_1, :a)
            expect(cpu_turn(board_1)).to be_a(Symbol)
            board_1.add_piece(:ply_1, :b)
            expect(cpu_turn(board_1)).to be_a(Symbol)
            board_1.add_piece(:ply_1, :c)
            expect(cpu_turn(board_1)).to be_a(Symbol)
        end

        it 'blocks a winning move from player 1' do
            board_1 = Board.new
            board_1.populate_columns
            board_2 = Board.new
            board_2.populate_columns

            board_2.add_piece(:ply_1, :a)
            board_2.add_piece(:ply_1, :a)
            board_2.add_piece(:ply_1, :a)

            expect(cpu_turn(board_2)).to eq(:a)
  
            board_1.add_piece(:ply_1, :a)
            board_1.add_piece(:ply_1, :b)
            board_1.add_piece(:ply_1, :c)
            expect(cpu_turn(board_1)).to eq(:d)
        end

        it 'will place a winning piece if it can win' do
            board_1 = Board.new
            board_1.populate_columns
            board_2 = Board.new
            board_2.populate_columns

            board_2.add_piece(:ply_2, :a)
            board_2.add_piece(:ply_2, :a)
            board_2.add_piece(:ply_2, :a)

            expect(cpu_turn(board_2)).to eq(:a)
  
            board_1.add_piece(:ply_2, :a)
            board_1.add_piece(:ply_2, :b)
            board_1.add_piece(:ply_2, :c)
            expect(cpu_turn(board_1)).to eq(:d)
        end
    end

    describe '#winning_move' do
        it 'checks if players next move will win' do
            board_1 = Board.new
            board_1.populate_columns
            board_2 = Board.new
            board_2.populate_columns

            board_1.add_piece(:ply_1, :a)
            board_1.add_piece(:ply_1, :b)
            board_1.add_piece(:ply_1, :c)

            expect(winning_move(@player_1.player, board_1)).to eq(:d)
            expect(winning_move(@player_2.player, board_1)).to eq(false)

            board_2.add_piece(:ply_2, :a)
            board_2.add_piece(:ply_2, :a)
            board_2.add_piece(:ply_2, :a)
            # binding.pry
            expect(winning_move(@player_1.player, board_2)).to eq(false)
            expect(winning_move(@player_2.player, board_2)).to eq(:a)
        end
    end
end