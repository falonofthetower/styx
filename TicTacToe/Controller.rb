class TicTacToe::Controller
  attr_accessor :result, :winner
  attr_reader :user, :computer, :board

  def initialize(user)
    @user = user
    @computer = Computer.new
    @board = TicTacToe::Board.new
    @winner = false
  end

  def user_chooses_square
    begin
      View.new(0).tic_tac_toe_board(board.squares, 1)    
      input = gets.chomp
      valid = board.valid_squares.has_key? input  
      if valid
        board.squares[input] = "X"
        View.new(0).tic_tac_toe_board(board.squares)
      else        
        View.new.invalid_choice(input)        
      end      
      self.winner = 'user' if board.check_for_winner == "user"
      self.winner = 'tie' if board.check_for_winner == 'tie'
    end until valid 
  end

  def computer_chooses_square    
    board.squares[board.valid_squares.keys.sample] = "O"

    self.winner = 'computer' if board.check_for_winner == "computer"
    self.winner = 'tie' if board.check_for_winner == 'tie'
    View.new(0).tic_tac_toe_board(board.squares)
  end

  def process_winner
    self.winner == 'user' ? user.wins += 1 : computer.wins += 1
  end

  def declare_winner
    View.new.declare_tic_tac_toe_winner(self.winner, user.name)
  end

  def conclusion
    View.new.tic_tac_toe_conclusion
  end
end