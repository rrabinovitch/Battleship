class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @has_been_fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @has_been_fired_upon
  end

  def fire_upon
    @has_been_fired_upon = true
    @ship.hit if !empty?
  end

  def render(reveal_ship = false)
    if empty? && fired_upon?
      "M"
    elsif !empty? && fired_upon? && @ship.sunk?
      "X"
    elsif !empty? && fired_upon?
      "H"
    elsif !empty? && !fired_upon? && reveal_ship == true
      "S"
    elsif !@has_been_fired_upon
      "."
    end
  end
end
