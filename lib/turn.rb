class Turn
  attr_reader :player_board, :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    # @turn_type - whether this is an attribute, depends on how often this piece of info matters
  end

  def player_fires_at(user_input)

# alternatively, just fire_upon
# after validation of cell selection, cell is fired upon

# human = user_input is generated via gets.chomp
# computer =  user_input is generated randomly by program

# what has to happen before this method
  # if its players turn, use gets.chomp
  # if its computers turn, randomly generate
  end


end
