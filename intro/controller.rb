class Intro::Controller
  attr_accessor :user, :wins
 
  def initialize(user)
    @user = user
    computer = Computer.new
    self.play    
  end

  def play
    user = intro    
    the_forest    
  end

  def intro
    Intro::Views.new.intro
    begin
      if user.name == ''
        puts "You must give your name!"
      end
      user.name = gets.chomp     
    end until user.valid_name?
    Intro::Views.new.welcome user.name
    user          
  end

  def the_forest
    system("clear")
    Intro::Views.new.the_forest
    begin
      input = gets.chomp
      unless yes_or_no? input
        puts "#{user.name} you must answer yes or no!"        
      end
    end until yes_or_no? input
    abort if input == 'n'
  end

  def yes_or_no?(input)
    input.downcase == 'y' || input.downcase == 'n'
  end
end