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
    puts "\nSelect the first coordinate at which you'd like to place your cruiser:"
    print "=> "
    coord_1 = gets.chomp
    cruiser_coordinates << coord_1.upcase
    puts "\nSelect the second coordinate at which you'd like to place your cruiser:"
    print "=> "
    coord_2 = gets.chomp
    cruiser_coordinates << coord_2.upcase
    puts "\nSelect the third coordinate at which you'd like to place your cruiser:"
    print "=> "
    coord_3 = gets.chomp
    cruiser_coordinates << coord_3.upcase

    if @board.valid_placement?(@cruiser, cruiser_coordinates)
      @board.place(@cruiser, cruiser_coordinates)
    else
      puts "\nThose coordinates aren't valid - please try again"
      place_cruiser
    end
  end

  def place_submarine
    submarine_coordinates = []
    puts "\nSelect the first coordinate at which you'd like to place your submarine:"
    print "=> "
    coord_1 = gets.chomp
    submarine_coordinates << coord_1.upcase
    puts "\nSelect the second coordinate at which you'd like to place your submarine:"
    print "=> "
    coord_2 = gets.chomp
    submarine_coordinates << coord_2.upcase

    if @board.valid_placement?(@submarine, submarine_coordinates)
      @board.place(@submarine, submarine_coordinates)
    else
      puts "\nThose coordinates aren't valid - please try again"
      place_submarine
    end
  end

  def select_cell_to_fire
    puts "\nEnter the coordinate for your shot:"
    print "=> "
    coordinate = gets.chomp
    coordinate
  end

  def fire(computer_board)
    user_input = select_cell_to_fire.upcase

    if !@coordinates_guessed.include?(user_input) && computer_board.valid_coordinate?(user_input)
      computer_board.cells[user_input].fire_upon
      @coordinates_guessed << user_input
      # require "pry"; binding.pry
      sleep(1)
      if computer_board.cells[user_input].render == "H"
        puts "Your shot on #{user_input} was a hit."
      elsif computer_board.cells[user_input].render == "M"
        puts "Your shot on #{user_input} was a miss."
      elsif computer_board.cells[user_input].render == "X"
        puts "Your shot on #{user_input} sunk a ship."
      end
    else
      puts "\nThat was an invalid coodinate selection. Please choose another one."
      fire(computer_board)
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
