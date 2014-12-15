module BlackjackUser
  def wins!
    @cash += @bet * 2    
    @wins += 1
  end

  def make_bet
    @cash -= @bet
  end  

  def end_turn?
    @end_turn == true
  end

  def end_turn!
    @end_turn = true
  end

  def start_turn!
    @end_turn = false
  end

  def blackjack!
    @cash += @bet * 2.5    
    @wins += 1
  end

  def goes_broke!
    dies_horrible_death
  end

  def is_broke?
    @cash < 0
  end

  def push!
    @cash += @bet
  end

  def loses!    
  end  
end