require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

# TODO: create an exit option, at least build one in when taking user input
p 'Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora.'
p "Type 'GO' to start the game!"
'------------------------------------------------------------------'
user_input = gets.chomp.upcase

if user_input != 'GO'
  p "Sorry, we can only accept GO. We can chat more another time. Let's try again..."
  system("ruby war_or_peace_runner.rb")
elsif user_input == 'GO'
  Game.start
end

# TODO: consider movin everything below and what's missing to the Game.start
# Turn 1: Megan won 2 cards
# Turn 2: WAR - Aurora won 6 cards
# Turn 3: *mutually assured destruction* 6 cards removed from play
# ...
# ...
# ...
# Turn 9324: Aurora won 2 cards
# *~*~*~* Aurora has won the game! *~*~*~*
