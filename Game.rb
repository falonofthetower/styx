class Game < Controller
  attr_accessor :user

  def initialize
    @user = User.new    
  end

  def intro
    View.new.intro
    begin
      if user.name == ''
        puts "You must give your name!"
      end
      user.name = gets.chomp     
    end until user.valid_name?
    View.new.welcome user.name
    user          
  end

  def the_forest
    system("clear")
    View.new.the_forest
    begin
      input = gets.chomp
      unless yes_or_no? input
        puts "#{user.name} you must answer yes or no!"        
      end
    end until yes_or_no? input
    abort if input == 'n'
  end

end