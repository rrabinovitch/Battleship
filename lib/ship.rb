class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

#deleted unless, since it was redundant
  def sunk?
    @health == 0
  end

  def hit
    @health -= 1
  end
end
