class RockPaperScissors::Weapons
  attr_reader :user

   RESULTS =  { rock:      { scissors: 'crushes',    lizard:   'crushes' },
                paper:     { spock:    'disproves',  rock:     'covers' },
                scissors:  { paper:    'cuts',       lizard:   'decapitates' },
                lizard:    { paper:    'eats',       spock:    'poisons' },
                spock:     { rock:     'vaporizes',  scissors: 'smashes' }
              }

  def self.array
      RESULTS.keys
  end

  def self.valid?(weapon)    
    weapon.between?(1,RESULTS.count) ? true : false
  end 

  def self.compare_weapons(user,computer)    
    result = []
    user_wins = RESULTS.select {|k,v| v.key?(computer.weapon) && k == user.weapon }
    computer_wins = RESULTS.select {|k,v| v.key?(user.weapon) && k == computer.weapon }
    if computer_wins.empty? && !user_wins.empty?
      verb = user_wins[user.weapon][computer.weapon] 
      result << "Your #{user.weapon.capitalize} #{verb} my #{computer.weapon.capitalize} you win!"
      result << "user"
    elsif user_wins.empty? && !computer_wins.empty?
      verb = computer_wins[computer.weapon][user.weapon]
      result << "My #{computer.weapon.capitalize} #{verb} your #{user.weapon.capitalize} you lose!"
      result << "computer"
    else
      result << "My #{computer.weapon.capitalize} Draws your #{user.weapon.capitalize}"
      result << "draw"
    end
  end
end