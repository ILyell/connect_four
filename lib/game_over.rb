module GameOver
include Render

  def game_over?(board, coordinates)
    game_win_vertical?(board, coordinates) || game_win_horizontal?(board, coordinates)
  end

  def game_win_vertical?(board, coordinates)
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
    end
    counter = 0
    result
  end



  def game_restart?
    render_restart
    input = gets.chomp
    true if input.include?("y") || input.include?("Y")
  end

  def game_win_diagonal?(board, coordinates)
    column = coordinates[0] # :a
    row = coordinates[1] # 0
    player = board.columns[column][row].status # :ply_1
  end

  def get_diagonals(board, coordinates)
    column = coordinates[0] # :a
    row = coordinates[1] # 0
    player = board.columns[column][row].status # :ply_1
    counter  = 0
    piece_index = board.columns.keys.index(column)
    diagonal_array << board.columns[board.columns.keys[piece_index] + counter][row + counter]
  end
end