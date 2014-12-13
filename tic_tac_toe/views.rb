class TicTacToe::Views
  
  def initialize(time=0.5)
    system("clear")
    sleep time
  end

  def invalid_choice(choice="That")
    puts "#{choice} is an invalid answer"
    sleep 1
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
    if user_turn == 1
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
end