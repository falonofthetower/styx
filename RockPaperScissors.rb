class RockPaperScissors < Controller
  attr_accessor :result
  attr_reader :user, :computer  

  def initialize(user)
    @user = user
    @computer = Computer.new
  end

  def welcome
    View.rock_paper_scissors_welcome
  end

  def player_chooses_weapon        
    begin      
      weapons = Weapons.new
      array = Weapons.array      
      list = ''
      i = 1
      array.each do |each|
        list << " (#{i}) #{each.to_s},"      
        i += 1
      end
      View.player_chooses_weapon(list)
      weapon = gets.chomp.to_i      
    end until Weapons.valid? weapon
    @user.weapon = array[weapon -= 1]    
  end

  def computer_chooses_weapon
    computer.weapon = Weapons::RESULTS.keys.sample
  end

  def compare_weapons(user,computer)
    result = Weapons.compare_weapons(user,computer)      
    if result[1] == "user"
      @user.wins += 1 
    elsif result[1] == "computer"
      @computer.wins += 1
    end 
    View.display_rps_result(result[0])          
  end
end