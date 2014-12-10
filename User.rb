class User < Player
  attr_accessor :name, :user

  def initialize
    @wins = 0    
  end

  def valid_name?
    true unless self.name == ''
  end  
end