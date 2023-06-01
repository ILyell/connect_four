require "spec_helper"

describe "Turn" do
  before do
    @player_1 = Player.new("Player", :ply_1)
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
      # WROTE THIS METHOD, NEED TO WRITE TESTS
    end

    xit "displays an error message asks the user to enter another letter A-G if they previously entered an invalid column" do

    end
  end


  describe "#valid_column?" do
    it "checks if an input value is a valid column on the board" do
      expect(@turn_1.valid_column?("a")).to be true  
      expect(@turn_1.valid_column?("B")).to be true  
      expect(@turn_1.valid_column?("h")).to be false  
      expect(@turn_1.valid_column?("column c")).to be false 
      expect(@turn_1.valid_column?(3)).to be false 
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

end
