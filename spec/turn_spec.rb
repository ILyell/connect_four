require "spec_helper"

describe "Turn" do
  before do
    @player_1 = "player holder"
    @board = Board.new
    @board.populate_columns

    @turn_1 = Turn.new(@player_1, @board)
  end

  describe "#initialize" do
    it "exists" do
      expect(@turn_1).to be_a Turn
    end
  end

  describe "#prompt_user" do
    xit "asks the user to enter a letter A-G" do

    end

    xit "displays an error message asks the user to enter another letter A-G if they previously entered an invalid column" do

    end
  end

  describe "#valid_input?" do

    it "returns False if the user enters anything other than a single letter string A-G" do
      expect(@turn_1.valid_input?("a")).to be true  
      expect(@turn_1.valid_input?("B")).to be true  
      expect(@turn_1.valid_input?("h")).to be false  
      expect(@turn_1.valid_input?("column c")).to be false 
      expect(@turn_1.valid_input?(3)).to be false 
    end

    it "returns False if the user enters the letter name of a full column" do
      # Set the topmost cell of the B column to "X"
      @board.columns[:b][5].set_ply_1

      expect(@board.columns[:b][5].empty?).to be false

      expect(@turn_1.valid_input?("b")).to be false  
    end
    
    it "returns True if the user enters a single letter A-G into a column that is not full" do
      expect(@board.columns[:a][5].empty?).to be true
      
      expect(@turn_1.valid_input?("a")).to be true  
    end
    
  end

  describe "#clean_input" do
    it "returns a single letter string as a lowercase symbol" do
      input_1 = "A"
      input_2 = "f"


      expect(@turn_1.clean_input(input_1)).to eq(:a)
      expect(@turn_1.clean_input(input_2)).to eq(:f)
    end
  end

  describe "#place_piece" do
    xit "updates the board based on the user's column selection" do

    end
  end

end
