class Cell

    attr_reader :status

    def initialize
        @status = :empty
    end

    def empty?
        if @status == :empty
            true
        else
            false
        end
    end

    def ply_1?
        if @status == :ply_1
            true
        else
            false
        end
    end

    def ply_2?
        if @status == :ply_2
            true
        else
            false
        end
    end

    def set_ply_1
        @status = :ply_1
    end

    def set_ply_2
        @status = :ply_2
    end
end