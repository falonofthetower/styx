class Deck
  attr_accessor :shoe, :discard
  def initialize(decks=4)
    @shoe = []
    @discard = []

    suits = ['H', 'D', 'S', 'C']
    face = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']    
    deck = suits.product(face) * decks
    deck = deck.each do |suit,face|
      shoe << Cards.new(suit,face)
    end
    shoe.shuffle!    
  end

  def shuffle_cards!    
    discard.count.times do
      shoe << discard.pop
    end
    shoe.shuffle!    
  end

  def deal_card
    shoe.pop
    shuffle_if_low!
  end  

  def cleanup
    (user.hand.merge(computer.hand)).merge(discard)    
  end

  def shuffle_if_low!
    deck.shuffle_cards if deck.count < 25
  end

  def deal_card(hand)    
    hand << shoe.pop
  end
end