require_relative 'master/config'
class Styx
  attr_accessor :user  

  def play
    @user = User.new
    Intro::Controller.new(user)
    RockPaperScissors::Controller.new(user)
    TicTacToe::Controller.new(user).play
    Blackjack::Controller.new(user).play
  end
end

Styx.new.play