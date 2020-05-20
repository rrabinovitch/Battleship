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
    coord1 = gets.chomp
    cruiser_coordinates << coord1
    p "Select the second coordinate at which you'd like to place your cruiser:"
    coord2 = gets.chomp
    cruiser_coordinates << coord2
    p "Select the last coordinate at which you'd like to place your cruiser:"
    coord3 = gets.chomp
    cruiser_coordinates << coord3
    # can using a times do loop instead

    if @board.valid_placement?(@cruiser, cruiser_coordinates)
      @board.place(@cruiser, cruiser_coordinates)
    else
      "Those coordinates aren't valid - please try again"
      place_cruiser
    end
  end


  def select_cell_to_fire
    p "Enter a cell to fire at:"
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



# define place sumbarine

  # ask for user input - which cells to place ship in
  # => # of cells needed depends on which ship
  # confirm selected coordinates constitute valid placement on board
  # actually place ship

# to check if the human has lost:
# => board.all_ships_sunk?


end
