class View
  def initialize(time=0.5)
    system("clear")
    sleep time
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
    puts "A small child sits in the grass. He stands to his feet as you approach. He looks you up and down and holds out his fist."
    puts "'You know the rules?' You knod and the game begins"
  end

  def self.player_chooses_weapon(list)
    puts list
  end

  def display_rps_result(result)
    puts result
  end

  def tic_tac_toe_board(squares, user_turn=0)    
    puts "     |     |     "
    puts "  #{squares["7"]}  |  #{squares["8"]}  |  #{squares["9"]}     "      
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares["4"]}  |  #{squares["5"]}  |  #{squares["6"]}     "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares["1"]}  |  #{squares["2"]}  |  #{squares["3"]}     "
    puts "     |     |     "    
    if user_turn = 1
      puts "Pick your poison 1-9"
    end
    sleep 0.5
  end

  def declare_tic_tac_toe_winner(winner,name)
    if winner == 'tie'
      puts "There is no winner"
    elsif winner == 'user'
      puts "#{name} wins!"
    else
      puts "#{name} loses!"
    end
    sleep 1
  end

  def rock_paper_scissors_conclusion    
    puts "The boy sits back down and begins to scratch in the dirt. You watch for a minute and then hear noises from the east, walking into a stand of trees you find a woman older than the dust she sits in wrinkled as a crumpled flower."
    sleep 3
    puts "'Make your mark, boy'"
    sleep 3
    puts "Do you sit down? y/n"        
  end

  def tic_tac_toe_conclusion
    puts "The woman curls up her face in disgust and turns away from you."
    sleep 4
    puts "Confused you are about to ask what is wrong when the sound of windchimes draws your attention."
    sleep 4
    puts "You go deeper into the woods and find a set swaying in the wind."
    sleep 4
    puts "Tall as a man, vibrant as a woman, and more pure than a childs soul."
    sleep 4
    puts "You sit and listen to their tones until you fall asleep"
    sleep 4    
  end

  def the_man_with_the_cards
    sleep 4
    puts "You are asleep, dreaming of something both beautiful and profound. 
          Suddenly you hear the voices. The voices pounding in your head."
          sleep 3
          puts "'The man with the cards is coming...'"
          sleep 3
          puts "'The man with the cards is coming...'"
          sleep 3
          puts "'The man with the cards is coming...'"
          sleep 4          
  end
end