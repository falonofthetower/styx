class User < Player
  attr_accessor :name, :user, :wins, :bet
  include BlackjackUser

  def initialize    
    @wins = 0
    @hand = []
  end

  def valid_name?
    true unless self.name == ''
  end  
end