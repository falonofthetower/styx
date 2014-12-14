module BlackjackUser
  def wins_hand!
    @cash += @bet
    @bet = 0
  end

  def blackjacks!
    @cash += @bet * 1.5
    @bet = 0
  end

  def goes_broke!
    dies_horrible_death
  end

  def is_broke?
    @cash < 0
  end

  def push!
    @bet = 0
  end  
end