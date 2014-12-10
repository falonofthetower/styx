class Controller

  def yes_or_no?(input)
    input.downcase == 'y' || input.downcase == 'n'
  end
end