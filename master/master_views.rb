class MasterViews
  def initialize(time=0.5,clear=true)
    system("clear") if clear==true
    sleep time
  end

  def invalid_choice(choice="That")
    puts "#{choice} is an invalid answer"
    sleep 1
  end
end