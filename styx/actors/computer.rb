class Computer < Player
  attr_accessor :hand  
  include BlackjackDealer

  def initialize
      @wins = 0
      @hand = []
  end 
end