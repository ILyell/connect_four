require_relative "renderer.rb"

module GameStart
    include Render

    def game_start_message
        welcome_message
    end

    def start
        input = gets.chomp
        if input.include?("P") || input.include?("p")
            true
        elsif input.include?("Q") || input.include?("q")
            exit
        else
            error_message(:invalid_option, input)
            start
        end
    end
end