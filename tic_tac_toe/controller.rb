  class TicTacToe::Controller
  attr_accessor :result, :winner
  attr_reader :user, :computer, :board

  def initialize(user)
    @user = user
    @computer = Computer.new
    @board = TicTacToe::Board.new
    @winner = false    
  end

  def play
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
    end until user.wins >= 1
    tictactoe.conclusion
  end

  def user_chooses_square
    begin
      TicTacToe::Views.new(0).tic_tac_toe_board(board.squares, 1)    
      input = gets.chomp
      valid = board.valid_squares.has_key? input  
      if valid
        board.squares[input] = "X"
        TicTacToe::Views.new(0).tic_tac_toe_board(board.squares)
      else        
        TicTacToe::Views.new.invalid_choice(input)        
      end      
      self.winner = 'user' if board.check_for_winner == "user"
      self.winner = 'tie' if board.check_for_winner == 'tie'
    end until valid 
  end

  def computer_chooses_square    
    board.squares[board.valid_squares.keys.sample] = "O"

    self.winner = 'computer' if board.check_for_winner == "computer"
    self.winner = 'tie' if board.check_for_winner == 'tie'
    TicTacToe::Views.new(0).tic_tac_toe_board(board.squares)
  end

  def process_winner    
    self.winner == 'user' ? user.add_win : computer.add_win 
  end

  def declare_winner    
    TicTacToe::Views.new.declare_tic_tac_toe_winner(self.winner, self.user.name)
  end

  def conclusion
    TicTacToe::Views.new.tic_tac_toe_conclusion
  end
end