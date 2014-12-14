class User < Player
  attr_accessor :name, :user, :wins, :bet, :hand, :end_turn, :cash
  include BlackjackUser

  def initialize    
    @wins = 0
    @hand = Hand.new 
    @end_turn = false
    @cash = 100   
  end

  def valid_name?
    true unless self.name == ''
  end  
end