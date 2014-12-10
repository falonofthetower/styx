class View < Loader
  def initialize
    #system("clear")
  end

  def invalid_choice(choice="That")    
    puts "#{choice} is an invalid answer"
    sleep 1
  end

  def intro
    puts "The View Intro"
    puts "I need your name:"
  end

  def welcome(name)
    puts "Welcome #{name}"
  end

  def the_forest
    puts "You are walking through the woods one day and come upon a door. No walls, no roof, nothing beside it, nothing behind it."
    puts "Do you enter? Y/N"
  end

  def rock_paper_scissors_welcome
    puts "This is Rock Paper Scissors Lizard Spock bitches!!!"
  end

  def self.player_chooses_weapon(list)
    puts list
  end

  def display_rps_result(result)
    puts result
  end

  def tic_tac_toe_board(squares)
    puts "     |     |     "
    puts "  #{squares["1"]}  |  #{squares["2"]}  |  #{squares["3"]}     "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares["4"]}  |  #{squares["5"]}  |  #{squares["6"]}     "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares["7"]}  |  #{squares["8"]}  |  #{squares["9"]}     "      
    puts "     |     |     "
    puts "Pick your poison 1-9" 
  end
end