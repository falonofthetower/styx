class User < Player
  attr_accessor :name, :user, :wins, :bet, :hand, :end_turn, :cash

  FATES = ["was eaten by a bear",
           "was devoured by a lion", 
           "was struck by lighting...he died!",
           "was eaten by a grue",
           "was trampled by the bulls",
           "was consumed by the Dark Side"]

  include BlackjackUser

  def initialize    
    @wins = 0
    @hand = Hand.new 
    @end_turn = false
    @cash = 100.00  
  end

  def valid_name?
    self.name != ''
  end    

  def dies_horrible_death
    fate = "#{name} #{FATES.sample}"
    epitaph(fate)
    puts fate
    puts "GAME OVER"
    abort
  end

  def epitaph(fate)
    graveyard = File.open("graveyard.txt", "a")
    graveyard.puts fate
    graveyard.close
  end
end