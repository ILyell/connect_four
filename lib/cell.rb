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
        if @status == :ply_2?
            true
        else
            false
        end
    end
end