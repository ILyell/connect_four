
class Player


    attr_reader :name, :player

    def initialize(name, player, is_cpu = false)
        @name = name
        @player = player
        @is_cpu = is_cpu
    end

    def is_cpu?
        @is_cpu
    end
end