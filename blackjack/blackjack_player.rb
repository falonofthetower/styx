module BlackjackPlayer
  def check_for_bust?
    calculate_total(player[:hand]) > 21
  end

  def check_for_blackjack?(player)
    calculate_total(player[:hand] == 21 && player[:hand].count == 2)
  end

  def end_turn!(player)
    player[:end_turn] = true
  end  

  def blackjacks?(player)
    total_score player == 21 && player[:hand].count == 2
  end

  def bust?(player)
    total_score(player) > 21
  end

  def total_score
    total = 0
    aces = 0
    count = hand.map { |each| each[1] }
    count.each do |value|
      if value == 'A'
        total += 11
        aces += 1
      elsif value.to_i == 0
        total += 10    
      else
        total += value.to_i      
      end

      while total > 21 && aces > 0
        total += -10
        aces += -1
      end    
    end
    total
  end
end