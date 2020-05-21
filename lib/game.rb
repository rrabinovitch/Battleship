class Game
  attr_reader :human,
              :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def get_user_input
    gets.chomp
  end

  def display_menu
    puts "Welcome to BATTLESHIP:\n" +
      "Enter p to play. Enter q to quit."
    print "=> "
  end

  def setup
    @computer.place_cruiser
    @computer.place_submarine
    puts "I have laid out my ships on the grid.\n" +
        "You now need to lay out your two ships.\n" +
        "The cruiser is three units long and the submarine is two units long. \n" +
        "Here is what your board looks like:"
    puts "#{@human.board.render}"
    puts ""
    @human.place_cruiser
    puts ""
    puts "#{@human.board.render(true)}"
    @human.place_submarine
    puts ""
    puts ""
    puts "Let's start playing!\n" +
        "At the start of each turn, you'll see my board showing the cells at which you've already fired " +
        "and your board showing your own ships and the cells at which I've already fired. \n" +
        "You'll fire first."
    system 'clear'
    play
  end

  def play
    until over?
      display_boards
      @human.fire(@computer.board)
      @computer.fire(@human.board)
      system 'clear'
    end
    report_winner
  end

  def over?
    if @human.lost? || @computer.lost?
      true
    else
      false
    end
  end

  def display_boards
    puts "=============COMPUTER BOARD=============\n" +
    "#{@computer.board.render}\n" +
    "==============YOUR BOARD==============\n" +
    "#{@human.board.render(true)}"
  end

  def report_winner
    if @human.lost?
      puts "I won!"
    elsif @computer.lost?
      puts "You won!"
    else
      puts "There seems to have been an error."
    end
  end
end
