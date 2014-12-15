class Blackjack::Views < MasterViews
  def the_man_with_the_cards
    sleep 4
    puts "You are asleep, dreaming of something both beautiful and profound."
    puts "Suddenly you hear the voices. The voices pounding in your head."
    sleep 3
    puts "'The man with the cards is coming...'"
    sleep 3
    puts "'The man with the cards is coming...'"
    sleep 3
    puts "'The man with the cards is coming...'"
    sleep 4
  end

  def ask_for_bet
    puts "How much will you wager?"
  end

  def display_hand(hand,blind_card=false)  
    top_line =                   ""
    denomination_line =          ""
    suit_line =                  ""
    side_line =                  ""  
    bottom_line =                ""
    if hand != []
      hand.each do |card|
        if blind_card == true
          top_line <<             " ---  "      
          denomination_line <<    "| ~ | "
          suit_line <<            "| ~ | "
          side_line <<            "| ~ | "      
          bottom_line <<          " ---  "
          blind_card = false  
        else
          top_line <<             " ---  "
          denomination_line <<    "| #{card.value} | "    
          suit_line <<            "| #{card.suit} | "
          side_line <<            "|   | "        
          bottom_line <<          " ---  "
        end          
      end
    end
    puts top_line
    puts denomination_line
    puts suit_line
    puts side_line
    puts bottom_line      
  end
    

  def display_table(user_hand,dealer_hand,blind_card=true)    
    edge = '***********************************************************************'  
    system("clear")    
    puts edge
    display_hand(dealer_hand,blind_card)
    puts ""
    puts ""
    puts ""
    puts ""
    display_hand(user_hand)
    puts edge    
  end

  def get_user_choice
    puts "Will you hit? Or will you stay?"
  end

  def display_result_message(result,user,dealer)
    case result
    when :push
      puts "#{user.hand.total_score} weighs even with #{dealer.hand.total_score}: push"
      puts "A scowl and the impatient tapping of the finger accompany your retrivel of your chips"
    when :user_busts
      puts "#{user.hand.total_score} exceeds the limits: bust"
      puts "The man smiles broadly as he rakes your chips in"
    when :dealer_busts
      puts "#{dealer.hand.total_score} exceeds the limit"
      puts "He withdraws into his hooded cloak"
    when :double_blackjack
      puts "Lady luck has a sense of humor to bless us both"
      puts "He purses his lips as you take back your bet"
    when :user_blackjacks
      puts "You seem to have blackjacked."
      puts "The man snarls, a low grumble"
    when :user_greater_score
      puts "#{user.hand.total_score} exceeds #{dealer.hand.total_score}"
      puts "He counts out your pebbles with deliberate precision"
    when :dealer_blackjacks
      puts "The dark knave favors me today."
      puts "You feel as if his collecting hand is shaving away a piece of your soul"
    when :user_lesser_score
      puts "My #{dealer.hand.total_score} is greater than your #{user.hand.total_score}"
      puts "Your doom is nigh."
    end
  end

  def display_status(user)    
    puts "You have #{user.wins} stones, and #{user.cash} pebbles"
  end
end