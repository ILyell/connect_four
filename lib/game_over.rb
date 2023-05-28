module GameOver

  def game_win_vertical?(board, coordinates) # coordinates => [:a, 3]
    return false unless coordinates[1] >= 3

    column = coordinates[0]
    row = coordinates[1]
    player = board.columns[column][row].status

    counter = 1

    loop do 
      if board.columns[column][row -counter].status != player
        false
      elsif counter == 4
        true
      else
        counter += 1
      end
    end

    false
  end

end