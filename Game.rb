require_relative 'module_gameturn.rb'
require 'csv'
require_relative 'Player.rb' 
require_relative 'Treasure.rb' 

class Game 
  include GameTurn

  def initialize (title, players = [])
    @title = title
    @players = Array.new
    @players = players
   end

  def add_player(player) 
    @players.push(player)
  end 

  def play(times)

    for i in 1..times
      @players.each do |player|
        take_turn(player)   
      end
    end
    lions_and_sheep
  end

  def lions_and_sheep 
    @strong = Array.new
    @weak = Array.new

    @players.each do |player|
      if player.score > 350
        @strong.push("#{player.name} : #{player.score} points")
      else
        @weak.push("#{player.name} : #{player.score} points")
      end
    end
 end

  def print_stats
    
    puts " "
    puts "Strong players"    
    puts @strong
    puts " "
    puts "Wimpy players"
    puts @weak
    puts " "

  end

  def load_players(x) 
    
    allplayers = CSV.read(x)
    
    CSV.foreach(x) do |row|
      tr = Treasure.new(:bottle, 25)
      add_player(Player.new(row[0], row[1].to_i))
    end

  end


  def save_high_scores

    @CurrentScore = []
    @CurrentScoreSub = []

      @players.each do |player|
     
        @CurrentScoreSub.push(player.name)
        @CurrentScoreSub.push(player.score)
        @CurrentScore.push(@CurrentScoreSub)
        @CurrentScoreSub = []
      end


     @CurrentScore.each_index do |i|
        
      if @CurrentScore[i][1] > 100
        CSV.open("myfile.csv", "a+") do |csv|
            csv << [@CurrentScore[i][0], @CurrentScore[i][1] ]
        end
      end 
    end 

  end   
  

end

   
      


