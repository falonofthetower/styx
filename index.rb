require_relative 'styx/config'
class Styx
  attr_accessor :user  

  def play
    @user = User.new
    Intro::Controller.new(user)
    #RockPaperScissors::Controller.new(user)
    TicTacToe::Controller.new(self.user).play
    Blackjack::Controller.new
  end
end

Styx.new.play