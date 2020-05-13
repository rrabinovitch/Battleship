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
    # @ship.hit if @ship
  end

  def render(reveal_ship = false)
    if @has_been_fired_upon && empty?
      "M"
    elsif @has_been_fired_upon && !empty? && @ship.sunk?
      "X"
    elsif @has_been_fired_upon && !empty?
      "H"
    elsif reveal_ship == true && !@has_been_fired_upon && !empty?
      "S"
    elsif !@has_been_fired_upon
      "."
    end
  end
end
