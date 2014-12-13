class Intro::Views < MasterViews
 def intro
    puts "The View Intro"
    puts "I need your name:"
  end

  def welcome(name)
    puts "Welcome #{name}"
  end

  def the_forest

    puts "You are walking through the woods one day and come upon a door."
    puts " No walls, no roof, nothing beside it, nothing behind it."
    puts "Do you enter? Y/N"
  end
end