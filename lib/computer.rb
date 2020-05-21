class Computer
  attr_reader :board,
              :cruiser,
              :submarine,
              :coordinates_guessed

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @coordinates_guessed = []
  end

  def select_placement_coordinates(ship)
    coordinates = []
    until @board.valid_placement?(ship, coordinates)
      coordinates = []
      ship.length.times do
        coordinates << @board.cells.keys.sample
      end
    end
    coordinates
  end

  def place_cruiser
    cruiser_coordinates = select_placement_coordinates(@cruiser)
    @board.place(@cruiser, cruiser_coordinates)
  end

  def place_submarine
    submarine_coordinates = select_placement_coordinates(@submarine)
    @board.place(@submarine, submarine_coordinates)
  end

  def fire(human_board)
    puts "..."
    sleep(2)
    selection = @board.cells.keys.sample
    if !@coordinates_guessed.include?(selection)
      human_board.cells[selection].fire_upon
      @coordinates_guessed << selection
      sleep(1)
      if human_board.cells[selection].render == "H"
        puts "Your shot on #{selection} was a hit."
      elsif human_board.cells[selection].render == "M"
        puts "Your shot on #{selection} was a miss."
      elsif human_board.cells[selection].render == "X"
        puts "Your shot on #{selection} sunk a ship."
      end
    else
      select_cell_to_fire(human_board)
    end
  end

  def lost?
    if @board.all_ships_sunk?
      true
    else
      false
    end
  end
end
