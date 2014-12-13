require_relative 'styx/config'

user = User.new

Intro::Controller.new(user)
RockPaperScissors::Controller.new(user)
TicTacToe::Controller.new(user)
Blackjack::Controller.new