class Menu

  attr_reader :respose,
              :user_name

  def start_display_menu
    p "Welcome to BattleShip!"
    p  "All captians are required to have a name. What is your name?"
    @user_name = gets.chomp
    p "Type 'p' to (p)lay or 'q' to (q)uit!"
    p "------------------------------------------------------------------"
    @response = gets.chomp.upcase
    menu_response(response)
  end

  def menu_response(response)
    if respose == "P" || response == "PLAY"
      p "Good luck captian!"
    elsif response == "Q" || response == "QUIT"
      p "Thank you for playing #{user_name}!"
    else
      p  "Invalid input, please try again!"
    end
  end
end
