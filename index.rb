require_relative 'load_file'

game = Game.new
user = game.intro
computer = Computer.new
game.the_forest
rock_paper_scissors = RockPaperScissors.new(user)
rock_paper_scissors.welcome
begin
  rock_paper_scissors.player_chooses_weapon
  computer.weapon = rock_paper_scissors.computer_chooses_weapon
  rock_paper_scissors.compare_weapons(user,computer)
end until user.wins >= 10

