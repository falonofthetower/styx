class Player  
  attr_accessor :wins, :weapon, :hand

  include BlackjackPlayer
  require_relative 'computer'
  require_relative 'user'

  def add_win
    self.wins += 1
  end
end