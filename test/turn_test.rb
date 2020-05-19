require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @human_board = Board.new
    @computer_board = Board.new

    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)

    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)

    @turn = Turn.new(@human_board, @computer_board)

    @human_board.place(@human_cruiser, ["A1", "A2", "A3"])
    @human_board.place(@human_submarine, ["C1", "C2"])

    @computer_board.place(@computer_cruiser, ["B1", "B2", "B3"])
    @computer_board.place(@computer_submarine, ["D1", "D2"])

    @invalid_coordinate_message = "This is an invalid coordinate. Select another one to fire at."
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_each_player_has_a_board
    assert_equal @human_board, @turn.human_board

    rendered_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal rendered_board, @turn.human_board.render
    assert_equal rendered_board, @turn.computer_board.render
  end

  def test_it_can_reveal_ship_placement_on_each_players_board
    human_rendered_board_revealed = "  1 2 3 4 \n" +
                                    "A S S S . \n" +
                                    "B . . . . \n" +
                                    "C S S . . \n" +
                                    "D . . . . \n"

    computer_rendered_board_revealed = "  1 2 3 4 \n" +
                                      "A . . . . \n" +
                                      "B S S S . \n" +
                                      "C . . . . \n" +
                                      "D S S . . \n"

    assert_equal human_rendered_board_revealed, @turn.human_board.render(true)
    assert_equal computer_rendered_board_revealed, @turn.computer_board.render(true)

  end

  def test_human_can_fire_at_computer_board_and_render_different_types_of_hits
    @turn.human_fires_at_computer("A4")
    assert_equal true, @turn.computer_board.cells["A4"].fired_upon?
    assert_equal "M", @turn.computer_board.cells["A4"].render

    @turn.human_fires_at_computer("D1")
    assert_equal true, @turn.computer_board.cells["D1"].fired_upon?
    assert_equal "H", @turn.computer_board.cells["D1"].render
    assert_equal 1, @turn.computer_board.cells["D1"].ship.health
    assert_equal false, @turn.computer_board.cells["D1"].ship.sunk?

    @turn.human_fires_at_computer("D2")
    assert_equal true, @turn.computer_board.cells["D2"].fired_upon?
    assert_equal "X", @turn.computer_board.cells["D2"].render
    assert_equal "X", @turn.computer_board.cells["D1"].render
    assert_equal true, @turn.computer_board.cells["D1"].ship.sunk?

    # add assertion to check if any ships remaining?
  end

  def test_human_receives_error_message_if_fire_attempted_on_invalid_coordinate

  end

  def test_it_can_identify_remaining_cells_on_each_board
    @turn.human_fires_at_computer("A4")
    @turn.human_fires_at_computer("D1")
    @turn.human_fires_at_computer("D2")
    assert_equal false, @turn.computer_board.cells.include?(@computer_board.cells["A4"])
    assert_equal false, @turn.computer_board.cells.include?(@computer_board.cells["D1"])
    assert_equal false, @turn.computer_board.cells.include?(@computer_board.cells["D2"])

    # add assertions for computer's board after human fires a few times
  end

  def test_computer_can_fire_at_human_board
    @turn.computer_fires_at_user("A1")
    @turn.computer_fires_at_user("B1")

    assert_equal false, @turn.human_board.remaining_cells.include?(@human_board.cells["A1"])
    assert_equal false, @turn.human_board.remaining_cells.include?(@human_board.cells["B1"])

    random_cell = @turn.computer_select_cell
    @turn.computer_fires_at_user(random_cell)
    
    assert_equal 13, @turn.human_board.remaining_cells.count
  end

  def test_it_can_display_results
    skip
    @turn.human_fires_at_computer("A4")
    @turn.human_fires_at_computer("D1")
    @turn.human_fires_at_computer("D2")

    @turn.computer_fires_at_user
    assert_equal 15, @turn.human_board.remaining_cells.count

    5.times do
      @turn.computer_fires_at_user
    end
    assert_equal 10, @turn.human_board.remaining_cells.count
  end
end
