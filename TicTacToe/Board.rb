class TicTacToe::Board
  attr_accessor :squares, :board

  WINS = [["1","2","3"], ["4","5","6"], ["7","8","9"], 
         ["1","4","7"], ["2","5","8"], ["3","6","9"], 
         ["1","5","9"], ["3","5","7"]]
  
  def valid_squares
    self.squares.select { |_,v| v == " " }
  end
  
  def valid?(square)    
    valid_squares.has_key?(square)
  end
  
  def to_s
    self.each do |each|
      str << "#{each}, " 
    end
    string = str.chop.chop
  end

  def initialize
    @squares = {
      "1" => " ",
      "2" => " ",
      "3" => " ",
      "4" => " ",
      "5" => " ",
      "6" => " ",
      "7" => " ",
      "8" => " ",
      "9" => " "
    }
  end

  def check_for_winner    
    case
    when squares.select { |_,v| v == "X" }.keys.permutation(3).to_a & WINS != [] 
      "user"
    when squares.select { |_,v| v == "O" }.keys.permutation(3).to_a & WINS != [] 
      "computer"
    when self.valid_squares == {}
      "tie"
    else
      false
    end    
  end
end