# require_relative 'module_gameturn.rb'
# require_relative 'Player.rb' 
# require_relative 'Treasure.rb' 
# require_relative 'Dice.rb' 
# require_relative 'Game.rb' 

# player1 = Player.new("moe")  
# player2 = Player.new("larry", 60) 
# player3 = Player.new("lelos", 80) 
# player4 = Player.new("tzeni", 40)  

# tr = Treasure.new(:bottle, 25)  
# player2.found_treasure(tr)
  
# g = Game.new('roulette')

# g.add_player(player1)
# g.add_player(player2)
# g.add_player(player3)
# g.add_player(player4)

# g.play(5)


# #puts player1
# #puts player2
# #puts player3
# #puts player4

# g.print_stats(strong, weak)

require_relative 'Game'

knuckleheads = Game.new 'Knuckleheads'
knuckleheads.load_players(ARGV.shift || 'players.csv')

loop do
    puts "\nHow many game rounds? ('quit' to exit)" 
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        knuckleheads.play answer.to_i
    when 'quit', 'exit', 'q'
        knuckleheads.print_stats
        knuckleheads.save_high_scores
        break
    else
        puts "Please enter a number or 'quit'"
    end
end