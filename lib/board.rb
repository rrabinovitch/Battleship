class Board
  attr_reader :cells

  def initialize
    @cells = make_cells
  end

  def make_cells
    {
          "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
          "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
          "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
          "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
        }
  end

  def valid_coordinate?(coordinate)
    self.cells.key?(coordinate)
  end

  def coordinates_and_ship_length_same_num?(ship, coordinates)
    ship.length == coordinates.count
  end

  def split_coordinates(coordinates)
    coordinates.map do |coordinate|
      coordinate.chars
    end
  end

  def coordinate_rows(coordinates) # array of coordinate letter values
    split_coordinates(coordinates).map do |coordinate|
      coordinate[0]
    end
  end

  def coordinates_in_same_row?(coordinates) # check if all coordinates' letters are same
    rows = coordinate_rows(coordinates)
    rows.all? do |row|
      rows[0] == row
    end
  end

  def coordinate_columns(coordinates) # array of coordinate number values
    split_coordinates(coordinates).map do |coordinate|
      coordinate[1].to_i
    end
  end

  def coordinates_in_same_column?(coordinates) # check if all coordinates' numbers are same
    columns = coordinate_columns(coordinates)
    columns.all? do |column|
      column[0] == column
    end
  end

  def coordinates_in_consecutive_rows?(coordinates) # check if all coordinates' letters are consecutive
    rows = coordinate_rows(coordinates)
    ordinal_rows = rows.map do |row|
      row.ord
    end
    ordinal_rows.each_cons(2).all? do |a, b|
      b == a + 1
    end
  end

  def coordinates_in_consecutive_columns?(coordinates) # check if all coordinates' numbers are consecutive
    columns = coordinate_columns(coordinates)
    columns.each_cons(2).all? do |a, b|
      b == a + 1
    end
  end

  def coordinates_consecutive?(coordinates)
    if coordinates_in_same_row?(coordinates) && coordinates_in_consecutive_columns?(coordinates)
      true
    elsif coordinates_in_same_column?(coordinates) && coordinates_in_consecutive_rows?(coordinates)
     true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if coordinates_and_ship_length_same_num?(ship, coordinates) && coordinates_consecutive?(coordinates)
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
end
