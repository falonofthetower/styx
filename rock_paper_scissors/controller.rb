class RockPaperScissors::Controller  
  attr_accessor :result
  attr_reader :user, :computer  

  def initialize(user)
    @user = user    
    @computer = Computer.new
    self.play
  end

  def play
    welcome
    begin
      player_chooses_weapon
      computer.weapon = computer_chooses_weapon
      compare_weapons(user,computer)
    end until user.wins >= 1
    conclusion    
  end

  def welcome
    RockPaperScissors::Views.new.rock_paper_scissors_welcome
  end

  def player_chooses_weapon        
    begin
      weapons = RockPaperScissors::Weapons.new
      array = RockPaperScissors::Weapons.array      
      list = ''
      i = 1
      array.each do |each|
        list << " (#{i}) #{each.to_s},"      
        i += 1
      end
      RockPaperScissors::Views.player_chooses_weapon(list)
      weapon = gets.chomp.to_i      
    end until RockPaperScissors::Weapons.valid? weapon    
    user.weapon = array[weapon -= 1]    
  end

  def computer_chooses_weapon
    computer.weapon = RockPaperScissors::Weapons::RESULTS.keys.sample
  end

  def compare_weapons(user,computer)
    result = RockPaperScissors::Weapons.compare_weapons(user,computer)      
    if result[1] == "user"
      @user.wins += 1 
    elsif result[1] == "computer"
      @computer.wins += 1
    end 
    RockPaperScissors::Views.new.display_rps_result(result[0])          
  end

  def conclusion
    RockPaperScissors::Views.new.rock_paper_scissors_conclusion
    begin
      input = gets.chomp
      unless yes_or_no? input
        puts "#{user.name} you must answer yes or no!"        
      end
    end until yes_or_no? input  
  end

  def yes_or_no?(input)
    input.downcase == 'y' || input.downcase == 'n'
  end
end