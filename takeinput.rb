class TakeInput
  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    while option.nil? || option < 1 || option > 13
      puts 'Please enter a number between 1 and 13!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end
end
