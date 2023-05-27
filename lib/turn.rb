class Turn

  def initialize(player, board)
    @player = player
    @board = board
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

end