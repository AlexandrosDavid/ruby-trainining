require_relative 'Dice.rb' 
require_relative 'Treasure.rb' 
require 'csv'

module GameTurn
  	def take_turn(player)
    	dice = Dice.new
    	roll = dice.roll
		allTreasures = CSV.read("treasures.csv")
    	player.found_treasure(Treasure.new(:allTreasures[roll-1][0], allTreasures[roll-1][1].to_i))
    	
		if roll == 1 || roll == 2 
	       player.blam
	    elsif roll == 5 || roll == 6
	       player.w00t
	    end 
	end
end