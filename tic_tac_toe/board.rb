class TicTacToe::Board
  attr_accessor :squares, :board

  def initialize
    starting_player = 1
    begin  
      tictactoe = TicTacToe::Controller.new(user)
      begin
      if starting_player == 1   
        tictactoe.user_chooses_square
      else
        sleep 1
        tictactoe.computer_chooses_square
      end
      unless tictactoe.winner
        if starting_player == 1
          sleep 1
          tictactoe.computer_chooses_square
        else
         tictactoe.user_chooses_square
       end
      end
    end until tictactoe.winner
    tictactoe.process_winner
    tictactoe.declare_winner  
    starting_player = starting_player * -1
    end until user.wins >= 5
    tictactoe.conclusion
  end

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