class Player
  attr_reader :name, :p1_or_p2

  def initialize(name, player, is_cpu = false)
    @name = name
    @p1_or_p2 = player
    @is_cpu = is_cpu
  end

  def is_cpu?
    @is_cpu
  end
end