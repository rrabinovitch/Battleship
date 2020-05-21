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
    puts "Welcome to BATTLESHIP \n" +
      "Enter p to play. Enter q to quit."
  end

  def setup
    @computer.place_cruiser
    @computer.place_submarine
    puts "I have laid out my ships on the grid. \n" +
        "You now need to lay out your two ships." +
        "The cruiser is three units long and the submarine is two units long. \n" +
        "Here is what your board looks like:"
    puts "#{@human.board.render}"
    @human.place_cruiser
    puts "#{@human.board.render(true)}"
    @human.place_submarine
    # @human.board.render(true)
    puts "Let's start playing! \n" +
        "At the start of each turn, you'll see my board showing the cells at which you've already fired " +
        "and your board showing your own ships and the cells at which I've already fired. \n" +
        "You'll fire first."
  end

  def play
    until over?
      display_boards
      @human.fire(@computer.board)
      @computer.fire(@human.board)
      # report_turn_results
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
    puts "=============COMPUTER BOARD============= \n" +
    "#{@computer.board.render} \n" +
    "==============YOUR BOARD============== \n" +
    "#{@human.board.render(true)}"
  end

  def report_turn_results
    # to be referenced in start method
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

### setup is complete
### show user @computer.board.render + @human.board.render(true)
#
### human fires at computer board - entering their cell selection themselves
### => @human.fire(@computer.board)
### computer fires at human board - randomly selected cell
### => @computer.fire(@human.board)
# *** # COME BACK TO THIS LATER: report results
# *** #  => your shot on #{selected coordinate} was a #{hit, miss, sink?}
# *** #  => my shot on #{selected coordinate} was a #{hit, miss, sink?}
### display updated boards - w computer's board just rendered, and human's rendered *true*
#
### repeat the above chunk until game.over?
### => which is true when @human.lost? || @computer.lost?
### =>  if human.lost? => p "I won!"
### =>  if computer.lost? => p "You won!"
#
# return to main menu
