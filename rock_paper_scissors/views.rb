class RockPaperScissors::Views < MasterViews
  def rock_paper_scissors_welcome
    puts "A small child sits in the grass. He stands to his feet as you approach."
    puts "He looks you up and down and holds out his fist."
    puts "'You know the rules?' You nod and the game begins"
  end

  def self.player_chooses_weapon(list)
    puts list
  end

  def display_rps_result(result)
    puts result
  end

  def rock_paper_scissors_conclusion
    puts "The boy sits back down and begins to scratch in the dirt."
    puts "You watch for a minute and then hear noises from the east."
    puts "Walking into a stand of trees you find a woman older than the dust she sits in"
    sleep 3
    puts "'Make your mark, boy'"
    sleep 3
    puts "Do you sit down? y/n"
  end
end
