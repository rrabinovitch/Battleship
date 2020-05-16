class Board
  def initialize
    @cells = {}
  end

  def cells
    @cells = {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    self.cells.key?(coordinate)
  end

  def coordinate_and_ship_length_same?(ship, coordinates)
    ship.length == coordinates.count
  end

  def coordinates_consecutive?(coordinates)
    coordinates.all? do |coordinate|
      # checking if letters of each coordinate's letter is the same as that of the first passed coordinate
      # OR if each coordinate's number is the same as that of the first
      coordinates[0][0] == coordinate[0] || coordinates[0][1] == coordinate[1]
    end

  end

  def valid_placement?(ship, coordinates)
    if coordinate_and_ship_length_same? && coordinates_consecutive?
      true
    else
      false
    end
  end
end


### first determining whether coordinate #s == length of ship
### then whether either the coordinates have same letter or same number
    # if neither letters nor numbers are same, then invalid
    # if yes same letters, then check if numbers are consecutive
    # or if yes same numbers then check if letters are consecutive
