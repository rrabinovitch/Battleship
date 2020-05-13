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
    @has_been_fired_upon = true if @ship.hit
  end

  def render(reveal_ship = false)
    if @has_been_fired_upon && !@ship
      "M"
    elsif @has_been_fired_upon && @ship
      "H"
    elsif @has_been_fired_upon && @ship && @ship.sunk?
      "X"
    elsif reveal_ship == true && !@has_been_fired_upon && @ship
      "S"
    else
      "."
    end
  end
end
