require "spec_helper"
include GameOver

RSpec.describe GameOver do
  before(:each) do
    @board = Board.new
    @board.populate_columns
  end

  describe '#game_over' do
    it 'returns false if run on an empty board' do
      
        # A B C D E F G
        # . . . . . . .
        # . . . . . . .
        # . . . . . . .
        # . . . . . . .
        # . . . . . . .
        # . . . . . . .

        expect(game_over?(@board)).to be false
    end

    it 'returns false if both players have pieces on the board but neither player has won' do
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :c)

      expect(game_over?(@board)).to be false
     
      @board.add_piece(:ply_2, :d)

      expect(game_over?(@board)).to be false
    end

    it 'returns the symbol of the winning player for vertical wins' do
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)

      expect(game_over?(@board)).to eq(:ply_1)
    end
    
    it 'returns the symbol of the winning player for horizontal wins' do
      @board.add_piece(:ply_2, :a)
      @board.add_piece(:ply_2, :b)
      @board.add_piece(:ply_2, :c)
      @board.add_piece(:ply_2, :d)

      expect(game_over?(@board)).to eq(:ply_2)
    end
    
    it 'returns the symbol of the winning player for diagonal wins' do
      @board.add_piece(:ply_2, :a)

      @board.add_piece(:ply_2, :b)
      @board.add_piece(:ply_2, :b)

      @board.add_piece(:ply_2, :c)
      @board.add_piece(:ply_2, :c)
      @board.add_piece(:ply_2, :c)

      @board.add_piece(:ply_2, :d)
      @board.add_piece(:ply_2, :d)
      @board.add_piece(:ply_2, :d)
      @board.add_piece(:ply_2, :d)

      expect(game_over?(@board)).to eq(:ply_2)
    end

    it 'returns :draw if the game ends in a draw' do
      3.times { @board.add_piece(:ply_1, :a) }
      3.times { @board.add_piece(:ply_1, :c) }
      3.times { @board.add_piece(:ply_1, :e) }
      3.times { @board.add_piece(:ply_1, :g) }

      3.times { @board.add_piece(:ply_2, :b) }
      3.times { @board.add_piece(:ply_2, :d) }
      3.times { @board.add_piece(:ply_2, :f) }
      
      # A B C D E F G
      # . . . . . . .
      # . . . . . . .
      # . . . . . . .
      # X O X O X O X
      # X O X O X O X
      # X O X O X O X
      
      3.times { @board.add_piece(:ply_2, :a) }
      3.times { @board.add_piece(:ply_2, :c) }
      3.times { @board.add_piece(:ply_2, :e) }
      3.times { @board.add_piece(:ply_2, :g) }

      3.times { @board.add_piece(:ply_1, :b) }
      3.times { @board.add_piece(:ply_1, :d) }
      3.times { @board.add_piece(:ply_1, :f) }

      # A B C D E F G
      # O X O X O X O
      # O X O X O X O
      # O X O X O X O
      # X O X O X O X
      # X O X O X O X
      # X O X O X O X

      expect(game_over?(@board)).to eq(:draw)

    end
    
  end

  describe '#game_win_horizontal?' do
    it "can win with four pieces in a row horizontally" do

      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :c)
      
      expect(game_win_horizontal?(@board)).to eq(false)
      
      @board.add_piece(:ply_2, :d)
      
      expect(game_win_horizontal?(@board)).to eq(false)
      
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :d)
      
      expect(game_win_horizontal?(@board)).to eq(:ply_1)  
    end
  end


  describe "#game_win_vertical?" do
    it "can win with four pieces in a row vertically" do
      
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)

      expect(game_win_vertical?(@board)).to eq(:ply_1)
    end
  end

  describe '#restart_game' do
    # uses input, would refactor to include all input in main runner file if we had more time
  end

  describe "#get_diagonals_NE_SW" do
    it "returns an array of all diagonal NE -> SW cells relative to the most recently placed piece" do
      @board.add_piece(:ply_1, :a)
      
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :b)
      
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :c)
      
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)

      expected_diagonals = [@board.columns[:a][0], @board.columns[:b][1], @board.columns[:c][2], @board.columns[:d][3], @board.columns[:e][4], @board.columns[:f][5]]

      expect(get_diagonals_NE_SW(@board)).to eq(expected_diagonals)
    end
  end
  
  describe "#get_diagonals_NW_SE" do
    it "returns an array of all diagonal NW -> SE cells relative to input coordinates" do
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      @board.add_piece(:ply_1, :a)
      
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :b)
      
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :c)
      
      @board.add_piece(:ply_1, :d)

      expected_diagonals = [@board.columns[:a][3], @board.columns[:b][2], @board.columns[:c][1], @board.columns[:d][0]]

      expect(get_diagonals_NW_SE(@board)).to eq(expected_diagonals)
    end
  end

  describe '#game_win_diagonal?' do
    it 'returns the symbol of the winning player for diagonal NE -> SW wins: example #1' do
      @board.add_piece(:ply_1, :a)

      @board.add_piece(:ply_1, :b)
      @board.add_piece(:ply_1, :b)
      
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :c)
      @board.add_piece(:ply_1, :c)
      
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)

      expect(game_win_diagonal?(@board)).to eq(:ply_1)
    end

    it "can check if a player won by diagonal NE -> SW: example #2" do
      @board.add_piece(:ply_1, :c)

      @board.add_piece(:ply_1, :d)
      @board.add_piece(:ply_1, :d)
      
      @board.add_piece(:ply_1, :e)
      @board.add_piece(:ply_1, :e)
      @board.add_piece(:ply_1, :e)
      
      @board.add_piece(:ply_1, :f)
      @board.add_piece(:ply_1, :f)
      @board.add_piece(:ply_1, :f)
      @board.add_piece(:ply_1, :f)

      expect(game_win_diagonal?(@board)).to eq(:ply_1)
    end
    
    it "can check if a player won by diagonal: example #3" do
      6.times { @board.add_piece(:ply_1, :g) }
      
      5.times { @board.add_piece(:ply_1, :f) }
      
      4.times { @board.add_piece(:ply_1, :e) }
      
      2.times { @board.add_piece(:ply_2, :d) }
      @board.add_piece(:ply_1, :d)

      expect(game_win_diagonal?(@board)).to eq(:ply_1)
    end
  end

  describe '#game_over_draw?' do
    it "returns :draw if game ends in a draw" do
      3.times { @board.add_piece(:ply_1, :a) }
      3.times { @board.add_piece(:ply_1, :c) }
      3.times { @board.add_piece(:ply_1, :e) }
      3.times { @board.add_piece(:ply_1, :g) }

      3.times { @board.add_piece(:ply_2, :b) }
      3.times { @board.add_piece(:ply_2, :d) }
      3.times { @board.add_piece(:ply_2, :f) }
      
      # A B C D E F G
      # . . . . . . .
      # . . . . . . .
      # . . . . . . .
      # X O X O X O X
      # X O X O X O X
      # X O X O X O X
      
      3.times { @board.add_piece(:ply_2, :a) }
      3.times { @board.add_piece(:ply_2, :c) }
      3.times { @board.add_piece(:ply_2, :e) }
      3.times { @board.add_piece(:ply_2, :g) }

      3.times { @board.add_piece(:ply_1, :b) }
      3.times { @board.add_piece(:ply_1, :d) }
      3.times { @board.add_piece(:ply_1, :f) }

      # A B C D E F G
      # O X O X O X O
      # O X O X O X O
      # O X O X O X O
      # X O X O X O X
      # X O X O X O X
      # X O X O X O X

      expect(game_over_draw?(@board)).to eq(:draw)
    end

    it "returns false if game is not in a draw" do
      expect(game_over_draw?(@board)).to be false
    end
  end
end