require "spec_helper"
include GameOver

RSpec.describe GameOver do
  before do
    @board = Board.new
    @board.populate_columns
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
    


  describe "#game_win_vertical?" do
    it "can win with four pieces in a row vertically" do
      @board.columns[:a][0].set_ply(:ply_1)
      @board.columns[:a][1].set_ply(:ply_1)
      @board.columns[:a][2].set_ply(:ply_1)
      
      expect(game_win_vertical?(@board, [:a, 2])).to eq(false)

      @board.columns[:a][3].set_ply(:ply_1)

      expect(game_win_vertical?(@board, [:a, 3])).to eq(true)
    end
  end


  #   it "can win with four pieces in a row horizontally" do

  #   end

  #   it "can win with four pieces in a row diagonally" do

  #   end
  # end


end