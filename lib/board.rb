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
end