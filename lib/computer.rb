class Computer
  attr_reader :board, :cruiser, :submarine, :coordinates_guessed

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @coordinates_guessed = []
  end

  def fire(human_board)
    selection = @board.cells.keys.sample
    if !@coordinates_guessed.include?(selection)
      human_board.cells[selection].fire_upon
    else
      select_cell_to_fire(human_board)
    end
  end

  # def select_cell_to_fire(human_board)
  #   human_board.remaining_cells.keys.sample
  # end

  def computer_select_coordinates(ship)
    coordinates = []
    until @board.valid_placement?(ship, coordinates)
      coordinates = []
      ship.length.times do
        coordinates << @board.cells.keys.sample
      end
    end
    coordinates
  end

  def computer_place_ships
    cruiser_coordinates = computer_select_coordinates(cruiser)
    @board.place(cruiser, cruiser_coordinates)

    submarine_coordinates = computer_select_coordinates(submarine)
    @board.place(submarine, submarine_coordinates)
  end

  # check if computer has lost
end
