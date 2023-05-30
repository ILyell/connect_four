require "spec_helper"
include GameOver

RSpec.describe GameOver do
  before do
    @board_1 = Board.new
    @board_1.populate_columns
    @board_2 = Board.new
    @board_2.populate_columns
  end

  # CHECKS win conditions
  # WIN CONDITIONS
  # 1. Win, Lose, Draw
  # 4 of a kind,
  # Vertical,
  # Horizontal, 
  # Diagonal 
  # (two kinds of diagonal)
  # Checks what player may have won
  # calls the renderer to display a message
  describe '#game_over' do 
    it 'returns false if not a game over state, and the winning player if game over for horizontal wins' do
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :c)

      expect(game_over?(@board_1, @board_1.last_piece)).to eq(false)
      @board_1.add_piece(:ply_2, :d)
      
      expect(game_win_horizontal?(@board_1, @board_1.last_piece)).to eq(false)
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :c)
      @board_1.add_piece(:ply_1, :d)
      
      expect(game_over?(@board_1, @board_1.last_piece)).to eq(:ply_1)
      
      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :d)
      @board_2.add_piece(:ply_1, :c)
      @board_2.add_piece(:ply_2, :a) 
      @board_2.add_piece(:ply_1, :d)
      @board_2.add_piece(:ply_2, :e)
      
      expect(game_over?(@board_2, @board_2.last_piece)).to eq(false)
      
      @board_2.add_piece(:ply_1, :e)
      
      expect(game_over?(@board_2, @board_2.last_piece)).to eq(:ply_1)

    end

    it 'returns false if not a game over state, and the winning player if game over for vertical wins' do
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :a)
      
      expect(game_over?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_2, :a)
      
      expect(game_over?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :b)
      
      expect(game_over?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_1, :b)

      expect(game_over?(@board_1, @board_1.last_piece)).to eq(:ply_1)
      
      @board_2.add_piece(:ply_2, :b)
      @board_2.add_piece(:ply_2, :b)
      @board_2.add_piece(:ply_2, :b)
      
      expect(game_over?(@board_2, @board_2.last_piece)).to eq(false)

      @board_2.add_piece(:ply_1, :b)

      expect(game_over?(@board_2, @board_2.last_piece)).to eq(false)

      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :c)

      expect(game_over?(@board_2, @board_2.last_piece)).to eq(:ply_2)
    end
    
  end

  describe '#game_win_horizontal?' do
    it "can win with four pieces in a row horizontally" do

      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :c)
      
      expect(game_win_horizontal?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_2, :d)
      
      expect(game_win_horizontal?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :c)
      @board_1.add_piece(:ply_1, :d)
      
      expect(game_win_horizontal?(@board_1, @board_1.last_piece)).to eq(:ply_1)

      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :d)
      @board_2.add_piece(:ply_1, :c)
      @board_2.add_piece(:ply_2, :a) 
      @board_2.add_piece(:ply_1, :d)
      @board_2.add_piece(:ply_2, :e)
      
      expect(game_win_horizontal?(@board_2, @board_2.last_piece)).to eq(false)
      
      @board_2.add_piece(:ply_1, :e)
      
      expect(game_win_horizontal?(@board_2, @board_2.last_piece)).to eq(:ply_1)
      
    end
  end


  describe "#game_win_vertical?" do
    it "can win with four pieces in a row vertically" do
      
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :a)
      @board_1.add_piece(:ply_1, :a)
      
      expect(game_win_vertical?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_2, :a)
      
      expect(game_win_vertical?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :b)
      
      expect(game_win_vertical?(@board_1, @board_1.last_piece)).to eq(false)
      
      @board_1.add_piece(:ply_1, :b)

      expect(game_win_vertical?(@board_1, @board_1.last_piece)).to eq(:ply_1)
      
      @board_2.add_piece(:ply_2, :b)
      @board_2.add_piece(:ply_2, :b)
      @board_2.add_piece(:ply_2, :b)
      
      expect(game_win_vertical?(@board_2, @board_2.last_piece)).to eq(false)

      @board_2.add_piece(:ply_1, :b)

      expect(game_win_vertical?(@board_2, @board_2.last_piece)).to eq(false)

      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_2, :c)
      @board_2.add_piece(:ply_1, :b)
      @board_2.add_piece(:ply_2, :c)

      expect(game_win_vertical?(@board_2, @board_2.last_piece)).to eq(:ply_2)
    end
  end

  describe '#restart_game' do
    xit 'restarts game with y or Y input, displays :invalid_input other wise' do
      #test goes here
    end
  end

  describe '#game_win_diagonal' do
    it 'can check south-west diagonal' do
      @board_1.add_piece(:ply_1, :a)

      @board_1.add_piece(:ply_1, :b)
      @board_1.add_piece(:ply_1, :b)
      
      @board_1.add_piece(:ply_1, :c)
      @board_1.add_piece(:ply_1, :c)
      @board_1.add_piece(:ply_1, :c)
      
      @board_1.add_piece(:ply_1, :d)
      @board_1.add_piece(:ply_1, :d)
      @board_1.add_piece(:ply_1, :d)
      @board_1.add_piece(:ply_1, :d)

      expect(game_win_diagonal(@board_1, @board_1.last_piece)).to eq(:ply_1)
    end
  end
end