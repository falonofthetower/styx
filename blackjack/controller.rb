 class Blackjack::Controller

  attr_accessor :user, :deck, :dealer, :msg, :views
  def initialize(user)
    @user = user
    @dealer = Computer.new
    @deck = Deck.new
    @views = Blackjack::Views.new 
    user.bet = 10.0   
  end

  def get_user_choice        
    views.display_table(user.hand.cards,dealer.hand.cards)    
    views.display_status(user)
    views.invalid_choice(@msg) if @msg
    @msg = false    
    views.get_user_choice    
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
    unless user.hand.bust?    
      begin            
        views.display_table(user.hand.cards,dealer.hand.cards,false)
        views.display_status(user)
        sleep 2
        unless dealer.hand.dealer_done?
          deck.deal_card dealer.hand.cards
          views.display_table(user.hand.cards,dealer.hand.cards,false)
          views.display_status(user)
          sleep 2
        end
      end until dealer.hand.dealer_done?    
      views.display_table(user.hand.cards,dealer.hand.cards,false)
      views.display_status(user)
      sleep 2
    end
  end

  def deal_round    
    user.dies_horrible_death if user.is_broke?
    user.bet = 10.0
    user.make_bet        
    views.display_table(user.hand.cards,dealer.hand.cards)
    sleep 0.7
    deck.deal_card user.hand.cards
    views.display_table(user.hand.cards,dealer.hand.cards)
    sleep 0.7
    deck.deal_card dealer.hand.cards
    views.display_table(user.hand.cards,dealer.hand.cards)
    sleep 0.7
    deck.deal_card user.hand.cards
    views.display_table(user.hand.cards,dealer.hand.cards)
    sleep 0.7
    deck.deal_card dealer.hand.cards
    views.display_table(user.hand.cards,dealer.hand.cards)
    sleep 0.7
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

  def display_winner(result)    
    views.display_table(user.hand.cards,dealer.hand.cards,false)      
    views.display_status(user)
    views.display_result_message(result,user,dealer)    
  end

  def determine_winner    
    if user.hand.bust?
      display_winner :user_busts
      user.loses!
    elsif dealer.hand.bust?
      display_winner :dealer_busts
      user.wins!
    elsif user.hand.blackjack? && dealer.hand.blackjack?
      display_winner :double_blackjack
      user.push!
    elsif dealer.hand.blackjack?
      display_winner :dealer_blackjacks
      user.loses!
    elsif user.hand.total_score == dealer.hand.total_score
      display_winner :push
      user.push!
    elsif user.hand.blackjack?
      display_winner :user_blackjacks
      user.blackjack!
    elsif user.hand.total_score > dealer.hand.total_score
      display_winner :user_greater_score
      user.wins!
    else
      display_winner :user_lesser_score
      user.loses!
    end
    sleep 4        
  end

  def cleanup_table
    until user.hand.cards.empty?
      deck.discard << user.hand.cards.pop
    end
    until dealer.hand.cards.empty?
      deck.discard << dealer.hand.cards.pop
    end
    user.dies_horrible_death if user.is_broke?
  end

  def reset_player
    user.end_turn = false
    user.bet = 0
  end

  def conclusion(user)
    views.blackjack_conclusion(user)
  end
  
  def play
    views.the_man_with_the_cards
    system("clear")
    views.blackjack_intro
    begin            
      deal_round
      user_round
      dealer_round
      determine_winner
      cleanup_table      
      reset_player
    end until user.wins >= 20
    conclusion(user)
  end 
end