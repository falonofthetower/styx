class Board < Loader
  attr_accessor :squares, :board
  
  def valid_squares
    self.squares.select { |_,v| v == " " }
  end
  
  def valid?(square)
    #binding.pry
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
end