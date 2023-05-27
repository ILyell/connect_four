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

   

  end

  describe "#clean_input" do
    it "returns a single letter string as a lowercase symbol" do
      input_1 = "A"
      input_2 = "f"


      expect(@turn_1.clean_input(input_1)).to eq(:a)
      expect(@turn_1.clean_input(input_2)).to eq(:f)
    end
  end

  describe "#update_board" do
    xit "updates the board based on the user's column selection" do

    end
  end

  describe "#render_board" do
    xit "renders the updated board in the terminal" do

    end
  end

  # EVENTUALLY, CHECK FOR WINNING STATUS

  

end
