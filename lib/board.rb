class Board

    attr_reader :col_a,
                :col_b,
                :col_c,
                :col_d,
                :col_e,
                :col_f,
                :col_g
    
    def initialize 
        @col_a = []
        @col_b = []
        @col_c = []
        @col_d = []
        @col_e = []
        @col_f = []
        @col_g = []
    end
end