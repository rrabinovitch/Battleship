class Turn
  attr_reader :human_board, :computer_board

  def initialize(human_board, computer_board)
    @human_board = human_board
    @computer_board = computer_board
  end

  # removed human fires at computer method


  # removed computer_select_cell method
  # removed computer fires at human


  # move to game class
      def display_computer_board
        "=============COMPUTER BOARD============= \n" +
        "#{@computer_board.render}"
      end

      def display_human_board
        "==============PLAYER BOARD============== \n" +
        "#{@human_board.render}"
      end

      def display_turn_results
        p "#{display_computer_board}" + "#{display_human_board}"
      end

  # def human_lost?
  #   # is there a way to turn this into oneline or just something shorter?
  #   if @human_board.all_ships_sunk? == true
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def computer_lost?
  #   if @computer_board.all_ships_sunk? == true
  #     true
  #   else
  #     false
  #   end
  # end
end
