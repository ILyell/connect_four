module GameOver
include Render

  def game_win_vertical?(board, coordinates) # coordinates => [:a, 3]
    if coordinates[1] < 3
      false
    else
      column = coordinates[0]
      row = coordinates[1]
      player = board.columns[column][row].status
      counter = 1
      3.times do
        if board.columns[column][row - counter].status != player
          break
        elsif counter == 4
          break
        else
          counter += 1
        end
      end
      if counter == 4
        player
      else
        false
      end
    end
  end

  def game_restart?
    render_restart
    input = gets.chomp
    true if input.include?("y") || input.include?("Y")
  end

end