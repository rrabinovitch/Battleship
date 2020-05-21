require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'
require './lib/computer'
require './lib/game'
require 'mocha/minitest'

class GameTest < Minitest::Test
  def setup
    @game = Game.new

    @human = @game.human
    @human_board = @game.human.board
    @human_cruiser = @human.cruiser
    @human_submarine = @human.submarine

    @computer = @game.computer
    @computer_board = @game.computer.board
    @computer_cruiser = @computer.cruiser
    @computer_submarine = @computer.submarine
  end

  def simulate_human_ship_placement
    @human_board.place(@human_cruiser, ["A1", "A2", "A3"])
    @human_board.place(@human_submarine, ["C1", "C2"])
  end

  def simulate_computer_ship_placement
    @computer_board.place(@computer_cruiser, ["B1", "B2", "B3"])
    @computer_board.place(@computer_submarine, ["D1", "D2"])
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_human_and_computer_players
    assert_equal @human, @game.human
    assert_instance_of Human, @game.human
    assert_equal @computer, @game.computer
    assert_instance_of Computer, @game.computer
  end

  def test_each_player_has_a_board
    assert_equal @human_board, @human.board

    rendered_board = "  1 2 3 4\n" +
                    "A . . . .\n" +
                    "B . . . .\n" +
                    "C . . . .\n" +
                    "D . . . ."

    assert_equal rendered_board, @human.board.render
    assert_equal rendered_board, @computer.board.render
  end

  def test_it_displays_a_menu
    skip # test doesn't work bc after printing the text, the return value of .display_menu is `nil `
    menu = "Welcome to BATTLESHIP:\n" +
            "Enter p to play. Enter q to quit."
    assert_equal menu, @game.display_menu
  end

  def test_it_can_be_set_up
    # testing game.setup method
  end

  def test_it_can_display_boards
    skip # test doesn't work bc after printing the text, the return value of .display_boards is `nil `
    human_board_revealed = "  1 2 3 4\n" +
                          "A S S S .\n" +
                          "B . . . .\n" +
                          "C S S . .\n" +
                          "D . . . ."

    computer_board_revealed = "  1 2 3 4\n" +
                              "A . . . .\n" +
                              "B S S S .\n" +
                              "C . . . .\n" +
                              "D S S . ."

    board_display = "=============COMPUTER BOARD=============\n" +
                    "#{@computer.board.render}\n" +
                    "==============YOUR BOARD==============\n" +
                    "#{@human.board.render(true)}"

    assert_equal board_display, @game.display_boards
  end

  def test_it_can_be_played_until_there_is_a_winner
    # testing game knows when to end
  end

  def test_it_can_report_computer_winner
    # testing game result reporting when computer has sunk all human's ships
  end

  def test_it_can_report_human_winner
    # testing game result reporting when human has sunk all computer's ships
  end

  def test_board_display_in_different_conditions
    #
  end

  def test_it_can_report_different_turn_results
    # when human has hit, sunk, vs missed computer's ship
    # and when computer has hit, sunk, vs missed human's ship
  end
end
