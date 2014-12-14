class Blackjack::Controller

  attr_accessor :user, :deck, :dealer, :msg
  def initialize(user)
    @user = user
    @dealer = Computer.new
    @deck = Deck.new
  end

  def get_user_bet    
    user.bet = 0
    Blackjack::Views.new.ask_for_bet
    begin
      answer = gets.chomp.to_i
      user.bet = answer if answer > 0
    end until user.bet != 0
  end

  def get_user_choice
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
    Blackjack::Views.new(0,clear=false).invalid_choice(@msg) if @msg10
    @msg = false
    Blackjack::Views.new(0,clear=false).get_user_choice
    choice = gets.chomp
    case choice
    when "h"
      deck.deal_card user.hand.cards
    when "s"
      user.end_turn!
    else
      @msg = "#{choice} is not a valid"        
    end        
  end

  def dealer_round    
    begin      
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      sleep 2
      unless dealer.hand.dealer_done?
        deck.deal_card dealer.hand.cards
        Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
        sleep 2
      end
    end until dealer.hand.dealer_done?
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
    sleep 2
  end

  def deal_round    
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
    #sleep 0.7
    deck.deal_card user.hand.cards
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
    #sleep 0.7
    deck.deal_card dealer.hand.cards
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
    #sleep 0.7
    deck.deal_card user.hand.cards
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
   # sleep 0.7
    deck.deal_card dealer.hand.cards
    Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards)
    #sleep 0.7
  end

  def user_round
    begin    
      if user.hand.bust?
        user.end_turn!
      else        
        get_user_choice        
      end
    end until user.end_turn?
  end 

  def determine_winner
    if user.hand.bust?
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("The man smiles broadly as he rakes your chips in")
      user.loses!
    elsif dealer.hand.bust?
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("His face is shrouded by his hood as he stonily watches you collect the winnings")
      user.wins!
    elsif user.hand.blackjack? && dealer.hand.blackjack?
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("He purses his lips as you take back your bet")
      user.push!
    elsif user.hand.total_score == dealer.hand.total_score
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("A scowl and the impatient tapping of the finger is his only response")
      user.push!
    elsif user.hand.blackjack?
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("The man snarls, a low grumble")
      user.blackjack!
    elsif user.hand.total_score > dealer.hand.total_score
      Blackjack::Views.new(0).display_table(user.hand.cards,dealer.hand.cards,false)
      Blackjack::Views.new(1,false).display_result_message("He counts out your chips with deliberate precision")
      user.wins!
    else
      user.loses!
    end        
  end

  def cleanup_table
    until user.hand.cards.empty?
      deck.discard << user.hand.cards.pop
    end
    until dealer.hand.cards.empty?
      deck.discard << dealer.hand.cards.pop
    end
  end

  def reset_player
    user.end_turn = false
    user.bet = 0
  end
  
  def play    
    begin      
      get_user_bet
      deal_round
      user_round
      dealer_round
      determine_winner
      cleanup_table      
      reset_player
    end until user.wins >= 20
  end 
end