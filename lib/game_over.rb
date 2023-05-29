module GameOver
include Render

  def game_over?(board, coordinates)
    game_win_vertical?(board, coordinates) || game_win_horizontal?(board, coordinates)
  end

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

  def game_win_horizontal?(board, coordinates)
    column = coordinates[0]
    row = coordinates[1]
    player = board.columns[column][row].status
    result = nil
    counter = 0
    board.columns.keys.each do |letter|
      if board.columns[letter][row].status == player
        counter += 1
      elsif counter == 4
        break
      elsif board.columns[letter][row].status != player
        counter = 0
      end
      if counter == 4
        result = player
      else
        result = false
      end
      # binding.pry
    end
    counter = 0
    result
  end

  def game_restart?
    render_restart
    input = gets.chomp
    true if input.include?("y") || input.include?("Y")
  end

end