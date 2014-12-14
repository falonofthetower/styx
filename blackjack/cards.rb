class Cards
  attr_reader :suit, :value
  def initialize(suit,face)
    @suit = suit
    @value = face
  end  
end