require_relative "renderer.rb"

class Turn
  include Render

  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def prompt_user
    render_board(@board)
 
    puts "\nChoose a column A-G.\n\n"

    input = gets.chomp
    
    if !valid_column?(input)
      puts "\"#{input}\" is not the name of a column. Just pick a letter A-G. It doesn't even have to be uppercase, we programmed around that.\n\n"

      prompt_user
    elsif !open_column?(input)
      puts "\"#{input}\" is full. Pick another column.\n\n"

      prompt_user
    else
      @board.add_piece(@player, clean_input(input))
    end
  end

  def valid_column?(input)
    return false unless input.is_a?(String) and input.length == 1

    valid_columns = @board.columns.keys

    valid_columns.include?(clean_input(input))
  end

  def open_column?(input)
    @board.columns[clean_input(input)][5].empty?
  end

  def clean_input(input)    
    input.downcase.to_sym
  end
end