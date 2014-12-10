class TicTacToe < Controller
  attr_accessor :result
  attr_reader :user, :computer, :board

  def initialize(user)
    @user = user
    @computer = Computer.new
    @board = Board.new
  end

  def user_chooses_square
    begin
      View.new.tic_tac_toe_board(board.squares)     
      input = gets.chomp      
      if board.valid? input
        board.squares[input] = "X"
      else
        #Eliminated this line to make sure it wasn't the problem
        #View.new.invalid_choice(input)        
      end
      #binding.pry
      #The loop works until you choose incorrectly in which case the player loses a turn      
    end until board.valid? input
  end

  def computer_chooses_square      
    board.squares[board.valid_squares.keys.sample] = "O"
  end
end