require_relative "renderer.rb"

class Turn
  include Render

  attr_reader :player, :board

  def initialize(player, board, is_cpu = false)
    @player = player
    @board = board
    @is_cpu = is_cpu
    @last_input = nil #
  end

  def prompt_user
    if @is_cpu 
      cpu_input = cpu_turn
      if open_column?(cpu_input)
        cpu_input
      else
        prompt_user
      end 
    else
      turn_instruction
      input = gets.chomp
      if input.include?("quit")
        exit
      elsif !valid_column?(input)
        error_message(:invalid_column, input)
        prompt_user
      elsif !open_column?(input)
        error_message(:full_column, input)
        prompt_user
      else
        clean_input(input)
      end
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

  def cpu_turn
    @board.columns.keys.sample
  end

  def update_board(board)
    @board = board
  end
end