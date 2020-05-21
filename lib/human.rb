class Human
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

  def place_cruiser
    cruiser_coordinates = []
    p "Select the first coordinate at which you'd like to place your cruiser:"
    coord_1 = gets.chomp
    cruiser_coordinates << coord_1.upcase
    p "Select the second coordinate at which you'd like to place your cruiser:"
    coord_2 = gets.chomp
    cruiser_coordinates << coord_2.upcase
    p "Select the third coordinate at which you'd like to place your cruiser:"
    coord_3 = gets.chomp
    cruiser_coordinates << coord_3.upcase
    # can try using a times do loop instead

    if @board.valid_placement?(@cruiser, cruiser_coordinates)
      @board.place(@cruiser, cruiser_coordinates)
    else
      p "\n Those coordinates aren't valid - please try again"
      place_cruiser
    end
  end

  def place_submarine
    submarine_coordinates = []
    p "Select the first coordinate at which you'd like to place your submarine:"
    coord_1 = gets.chomp
    submarine_coordinates << coord_1.upcase
    p "Select the second coordinate at which you'd like to place your submarine:"
    coord_2 = gets.chomp
    submarine_coordinates << coord_2.upcase
    # can try using a times do loop instead

    if @board.valid_placement?(@submarine, submarine_coordinates)
      @board.place(@submarine, submarine_coordinates)
    else
      p "\n Those coordinates aren't valid - please try again"
      place_submarine
    end
  end

  def select_cell_to_fire
    p "Select a cell to fire at:"
    coordinate = gets.chomp
    coordinate
  end

  def fire(computer_board)
    user_input = select_cell_to_fire

    if !@coordinates_guessed.include?(user_input) && computer_board.valid_coordinate?(user_input)
      computer_board.cells[user_input].fire_upon
      @coordinates_guessed << user_input
    else
      p "This is an invalid coordinate. Select another one to fire at."
      fire(computer_board)
      # calling a method within itself = recursive
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
