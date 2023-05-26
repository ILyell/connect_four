module Renderer

  def welcome_message
    puts "\nWelcome to CONNECT 4\n\n"
  end

  def render_board(board)
    puts " A B C D E F G"

    counter = 5

    while counter >= 0
      row = ""
      board.columns.keys.each do |key|
        row += " #{render_cell(board.columns[key][counter])}"
      end
      # require "pry"; binding.pry
      puts "\r #{row}"
      counter -= 1
    end
  end

  def render_cell(cell)
    if cell.empty?
      "."
    elsif cell.ply_1?
      "X"
    elsif cell.ply_2?
      "O"
    end
  end
end