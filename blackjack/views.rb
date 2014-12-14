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

  def display_result_message(message)
    puts message
    sleep 4
  end
end