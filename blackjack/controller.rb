class Blackjack::Controller
  attr_accessor :user, :deck, :dealer
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
    Blackjack::Views.get_player_choice
    choice = gets.chomp
    if choice.valid?(get_player_choice)
      case choice
      when "hit"
        deal_card user
      when "stay"
        end_turn! user
      end
    else
      Blackjack::Views.get_user_choice("#{choice} is not a valid option") 
    end
  end

  def deal_round    
    Blackjack::Views.new(0).display_table(user.hand,dealer.hand)
    sleep 0.7
    deck.deal_card user.hand
    Blackjack::Views.new(0).display_table(user.hand,dealer.hand)
    sleep 0.7
    deck.deal_card dealer.hand
    Blackjack::Views.new(0).display_table(user.hand,dealer.hand)
    sleep 0.7
    deck.deal_card user.hand
    Blackjack::Views.new(0).display_table(user.hand,dealer.hand)
    sleep 0.7
    deck.deal_card dealer.hand
    Blackjack::Views.new(0).display_table(user.hand,dealer.hand)
    sleep 0.7
  end

  def user_round
    begin
      if player_bust? user
        end_turn! user
      else
        get_user_choice
      end
    end until user[:end_turn]
  end

  def dealer_round
    begin
      dealer_make_choice
    end until dealer[:end_turn]
  end

  def determine_winner!
    if user.bust?
      user.busts!
    elsif dealer.bust?
      user.wins!
    elsif user.blackjack? && dealer.blackjack?
      user.push!
    elsif user.total_score == dealer.total_score
      user.push!
    elsif user.blackjack?
      user.blackjack!
    elsif user.total_score > dealer.total_score
      user.wins!
    else
      user.loses!
    end        
  end
  
  def play    
    begin      
      get_user_bet
      deal_round
      user_round
      dealer_round
      determine_winner      
    end until user[:win] >= 20
  end 
end