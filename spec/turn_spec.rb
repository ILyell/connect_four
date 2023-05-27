require "spec_helper"

describe "Turn" do
  before do
    @player_1 = "player holder"
    @board = Board.new

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

  describe "#valid_input?(<input>)" do
    xit "returns True if the user enters a single letter A-G" do

    end

    xit "returns False if the user enters anything other than a single letter A-G" do

    end

    xit "returns False if the user enters a full column" do

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
