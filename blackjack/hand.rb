class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total_score
    total = 0
    aces = 0
    count = cards.map { |each| each.value }
    unless cards == []
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

  def bust?
    self.total_score > 21
  end

  def dealer_done?
    self.total_score > 16
  end

  def blackjack?    
    self.total_score == 21 && self.cards.count == 2
  end

  def bust?
    self.total_score > 21
  end
end