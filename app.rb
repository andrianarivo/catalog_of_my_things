require_relative 'modules/game_module'

class App
  include GameModule

  def initialize
    @games = []
  end

  def run(option)
    case option
    when 3
      list_games
    when 6
      create_game
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
