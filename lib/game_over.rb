module GameOver
include Render

  def game_over?(board, coordinates)
    game_win_vertical?(board, coordinates) || game_win_horizontal?(board, coordinates) || game_win_diagonal?(board, coordinates)
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
    diagonals = [get_diagonals_NE_SW(board, coordinates), get_diagonals_NW_SE(board, coordinates)]
    
    column = coordinates[0]
    row = coordinates[1]
    player = board.columns[column][row].status # :ply_1
    
    winner = false
    
    diagonals.each do |diagonal|
      counter = 0

      diagonal.each do |cell|
        # require "pry"; binding.pry
        if counter >= 4
          winner = player
          break
        elsif cell.status == player
          counter += 1
        elsif cell.status != player
          counter = 0
        end
      end
      
      break if counter >= 4
    end

    winner
  end

  def get_diagonals_NE_SW(board, coordinates)
    column = coordinates[0] # :a
    row = coordinates[1] # 0
    player = board.columns[column][row].status # :ply_1

    column_keys = board.columns.keys
    
    counter  = 0
    
    piece_index = column_keys.index(column)
    
    diagonal_array = []
    
    (piece_index + 1).times do
      break if ((piece_index - counter) < 0) or ((row - counter) < 0)

      cell = board.columns[column_keys[(piece_index - counter)]][row - counter]

      diagonal_array << cell unless cell.nil?

      counter += 1
    end

    diagonal_array.reverse!

    counter = 1
    
    (5 - piece_index).times do
      cell = board.columns[column_keys[(piece_index + counter)]][row + counter]
      diagonal_array << cell unless cell.nil?
      counter += 1
    end
    # require "pry"; binding.pry
    diagonal_array
  end

  def get_diagonals_NW_SE(board, coordinates)
    column = coordinates[0] # :d
    row = coordinates[1] # 0
    player = board.columns[column][row].status # :ply_1

    column_keys = board.columns.keys
    
    counter  = 0
    
    column_index = column_keys.index(column) # 3
    
    diagonal_array = []
    
    # Gets NW Diagonals
    (column_index + 1).times do
      break if (column_index - counter) < 0

      cell = board.columns[column_keys[(column_index - counter)]][row + counter]

      diagonal_array << cell unless cell.nil?

      counter += 1
    end
    
    diagonal_array.reverse!
    
    counter = 1
    
    (5 - column_index).times do #2 times do
      # require "pry"; binding.pry
      break if (row - counter) < 0

      cell = board.columns[column_keys[(column_index + counter)]][row - counter]
      
      diagonal_array << cell unless cell.nil?

      counter += 1
    end
    
    # require "pry"; binding.pry
    diagonal_array
  end
end