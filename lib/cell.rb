class Cell

    attr_reader :status

    def initialize
        @status = :empty
    end

    def empty?
        @status == :empty
    end

    def ply_1?
        @status == :ply_1
    end

    def ply_2?
        @status == :ply_2
    end

    def set_ply(player)
        @status = player
    end
end