class MasterView
  def initialize(time=0.5)
    system("clear")
    sleep time
  end

  def invalid_choice(choice="That")
    puts "#{choice} is an invalid answer"
    sleep 1
  end
end