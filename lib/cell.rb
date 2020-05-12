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
end
