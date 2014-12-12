require_relative 'Styx/config'

game = Intro::Controller.new

user = game.intro
computer = Player::Computer.new
game.the_forest

# Rock Paper Scissors Round
rock_paper_scissors = RockPaperScissors::Controller.new(user)
rock_paper_scissors.welcome
begin
  rock_paper_scissors.player_chooses_weapon
  computer.weapon = rock_paper_scissors.computer_chooses_weapon
  rock_paper_scissors.compare_weapons(user,computer)
end until user.wins >= 1
rock_paper_scissors.conclusion

# Tic Tac Toe Round
starting_player = 1
begin  
  tictactoe = TicTacToe::Controller.new(user)
  begin
    if starting_player == 1   
      tictactoe.user_chooses_square
    else
      sleep 1
      tictactoe.computer_chooses_square
    end
    unless tictactoe.winner
      if starting_player == 1
        sleep 1
        tictactoe.computer_chooses_square
      else
        tictactoe.user_chooses_square
      end
    end
  end until tictactoe.winner
  tictactoe.process_winner
  tictactoe.declare_winner  
  starting_player = starting_player * -1
end until user.wins >= 5
tictactoe.conclusion

# Black Jack Round
Blackjack::Controller.new.intro


