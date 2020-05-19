class Turn
  attr_reader :human_board, :computer_board

  def initialize(human_board, computer_board)
    @human_board = human_board
    @computer_board = computer_board
    # @turn_type - whether this is an attribute, depends on how often this piece of info matters
  end

  def human_fires_at_computer(user_input)
    # user_input generated via gets.chomp
    if @computer_board.valid_coordinate?(user_input)
      @computer_board.cells[user_input].fire_upon
    else
      p "This is an invalid coordinate. Select another one to fire at."
    end
  end

  def computer_fires_at_user
    
  end


# computer =  user_input is generated randomly by program

# what has to happen before this method
  # if its players turn, use gets.chomp
  # if its computers turn, randomly generate


end
