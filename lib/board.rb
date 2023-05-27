class Board 
    attr_reader :columns

    def initialize 
        @columns = {
            a: [],
            b: [],
            c: [],
            d: [],
            e: [],
            f: [],
            g: []
        }
    end

    def populate_columns
        @columns.keys.each do |key|
            6.times do
                @columns[key] << Cell.new
            end
        end
    end

    def add_piece(player, letter)
        if columns[letter][0].empty?
            columns[letter][0].set_ply(player)
        elsif !columns[letter][5].empty?
            false
        else
            counter = 0
            until columns[letter][0 + counter].empty? do
                counter += 1
            end
            columns[letter][counter].set_ply(player)
        end
    end

    # i feel like we should move this to a different class. Maybe the Game class once we make
    def welcome_message
        puts "Welcome to connect 4, yadda yadda yadda\n\n"
    end
end
