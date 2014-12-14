module BlackjackDealer
  def make_choice
    total = calculate_total hand
    if total < 17
      deal_card computer
    else
      end_turn! computer
    end
  end
end