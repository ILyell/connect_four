module GameOver
include Render

  def game_over?(board)
    return false if board.last_piece.nil?
    game_win_vertical?(board) or 
    game_win_horizontal?(board) or 
    game_win_diagonal?(board) or
    game_over_draw?(board)
  end

  def game_restart?
    render_restart
    input = gets.chomp
    true if input.include?("y") || input.include?("Y")
  end

  def game_win_horizontal?(board)
    column = board.last_piece[0]
    row = board.last_piece[1]
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

  def game_win_vertical?(board)
    column = board.last_piece[0]
    row = board.last_piece[1]
    if row < 3
      false
    else
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

  
  def game_win_diagonal?(board)
    diagonals = [get_diagonals_NE_SW(board), get_diagonals_NW_SE(board)]
    
    column = board.last_piece[0]
    row = board.last_piece[1]
    player = board.columns[column][row].status
    
    winner = false
    diagonals.each do |diagonal|
      counter = 0
      
      diagonal.each do |cell|
        if counter >= 4
          winner = player
          break
        elsif cell.status == player
          counter += 1
        elsif cell.status != player
          counter = 0
        end
      end

      if counter >= 4
        winner = player
        break
      end
    end
    winner
  end
  
  def get_diagonals_NE_SW(board)
    column = board.last_piece[0]
    row = board.last_piece[1]
    player = board.columns[column][row].status
    
    column_keys = board.columns.keys
    
    
    piece_index = column_keys.index(column)
    
    diagonal_array = []
    counter  = 0
    
    (piece_index + 1).times do
      break if ((piece_index - counter) < 0) or ((row - counter) < 0)
      
      cell = board.columns[column_keys[(piece_index - counter)]][row - counter]
      
      diagonal_array << cell unless cell.nil?
      
      counter += 1
    end
    
    diagonal_array.reverse!
    
    counter = 1
    
    (6 - piece_index).times do
      cell = board.columns[column_keys[(piece_index + counter)]][row + counter]
      diagonal_array << cell unless cell.nil?
      counter += 1
    end
    diagonal_array
  end
  
  def get_diagonals_NW_SE(board)
    column = board.last_piece[0]
    row = board.last_piece[1]
    player = board.columns[column][row].status
    
    column_keys = board.columns.keys
    
    
    column_index = column_keys.index(column)
    
    diagonal_array = []
    counter  = 0
    
    (column_index + 1).times do
      break if (column_index - counter) < 0
      
      cell = board.columns[column_keys[(column_index - counter)]][row + counter]
      
      diagonal_array << cell unless cell.nil?
      
      counter += 1
    end
    
    diagonal_array.reverse!
    
    counter = 1
    
    (6 - column_index).times do
      break if (row - counter) < 0
      
      cell = board.columns[column_keys[(column_index + counter)]][row - counter]
      
      diagonal_array << cell unless cell.nil?
      
      counter += 1
    end
    diagonal_array
  end
  
  def game_over_draw?(board)
    draw = false
    count = 0
    board.columns.keys.each do |column|
      count += 1 if board.full_column?(column)
    end
    draw = :draw if count == 7
    draw
  end

  # def quit(input)
  #   return nil unless input.is_a?(String)
    
  #   exit if input.downcase == "quit"
  # end
end