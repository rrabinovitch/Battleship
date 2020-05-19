require 'minitest/autorun'
require 'minitest/pride'
require './lib/menu'

class MenuTest < Minitest::Test

  def setup
    @menu = Menu.new
  end

  def test_if_it_exists
    assert_instance_of Menu, @menu
  end

  # def test_it_can_get_user_name
  #   user_name = mock("User")
  #
  #   assert_eqaul user_name, @menu.user_name
  # end
end
