class Turn
  attr_reader :human_board, :computer_board

  def initialize(human_board, computer_board)
    @human_board = human_board
    @computer_board = computer_board
    # @turn_type - whether this is an attribute, depends on how often this piece of info matters
  end

  def player_fires_at(user_input)
    p "Choose a coordinate for your shot."



# after validation of cell selection, cell is fired upon

# human = user_input is generated via gets.chomp
# computer =  user_input is generated randomly by program

# what has to happen before this method
  # if its players turn, use gets.chomp
  # if its computers turn, randomly generate
  end


end
