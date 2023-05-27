class Turn

  def initialize(player, board)
    @player = player
    @board = board
  end



  # Turns user input into a key for Board.columns IE: clean_input("A") => :a
  def clean_input(input)    
    input.downcase.to_sym
  end

end