require_relative 'takeinput'

class Main
  def initialize
    prompt
  end

  def prompt
    puts 'Welcome to the Catalog of my things App!'
    loop do
      display_options
      option = TakeInput.new.take_input

      break if option == 7
    end
  end

  def display_options
    puts 'Please choose one of the options: '
    puts '1. - List all books'
    puts '2. - List all music albums'
    puts '3. - List games'
    puts '4. - Create a book'
    puts '5. - Create a music album'
    puts '6. - Create a game'
    puts '7. - Exit'
  end
end

Main.new
