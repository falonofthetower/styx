module BlackjackPlayer
  def check_for_bust?
    calculate_total(player[:hand]) > 21
  end

  def check_for_blackjack?(player)
    calculate_total(player[:hand] == 21 && player[:hand].count == 2)
  end

  def end_turn!(player)
    player.end_turn = true
  end  

  def blackjacks?(player)
    total_score player == 21 && player[:hand].count == 2
  end

  def bust?
    self.total_score > 21
  end
end