require "./lib/renderer"

class Turn
  include Renderer

  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def prompt_user
    puts ""
  end

  def valid_input?(input)
    # Guard clause for non-string input and longer than 1 letter
    return false unless input.is_a?(String) and input.length == 1

    clean_input = clean_input(input)

    if !@board.columns.keys.include?(clean_input)
      false
    elsif !@board.columns[clean_input][5].empty?
      false
    else
      true
    end
  end

  # Turns user input into a key for Board.columns IE: clean_input("A") => :a
  def clean_input(input)    
    input.downcase.to_sym
  end

  def place_piece(input)
    # We haven't written this method in the Board class yet, so I put it here as "update_board" as a placeholder. once this method is written, we can make it the appropriate method.

    # I'm also thinking that will this update the board object outside of the class? Will this persist after the fact?
    # Will the next turn use the current turn's turn.board as the input board of a new turn? 
    @board.update_board(@player, input)
  end

end