class View < Loader

  def self.intro
    puts "The View Intro"
    puts "I need your name:"
  end

  def self.welcome(name)
    puts "Welcome #{name}"
  end

  def self.the_forest
    puts "You are walking through the woods one day and come upon a door. No walls, no roof, nothing beside it, nothing behind it."
    puts "Do you enter? Y/N"
  end

  def self.rock_paper_scissors_welcome
    puts "This is Rock Paper Scissors Lizard Spock bitches!!!"
  end

  def self.player_chooses_weapon(list)
    puts list
  end

  def self.display_rps_result(result)
    puts result
  end
end