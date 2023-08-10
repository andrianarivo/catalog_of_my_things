require_relative '../app'
require_relative '../classes/item'
require_relative '../classes/game'

module GameModule
  def create_game
    print 'Publish Date (mm-dd-yyyy): '
    publish_date = gets.chomp
    print 'Multiplayer (Y/N): '
    multi = gets.chomp
    print 'Last played (mm-dd-yyyy): '
    last_played = gets.chomp
    game = Game.new(multi, last_played, publish_date)
    @games << game
    @items << game
    puts '======================================='
    puts '🤙     Game created successfully     👍'
    puts '======================================='
  end

  def list_games
    @games.each_with_index do |game, index|
      puts '------------------------------- '
      puts 'Games: '
      puts '------------------------------- '
      puts "#{index + 1}) Id: '#{game.id}', Published: '#{game.publish_date}',",
           "   Multiplayer: '#{game.multiplayer}', Last Played: '#{game.last_played_at}'"
      puts '------------------------------- '
    end
  end
end
