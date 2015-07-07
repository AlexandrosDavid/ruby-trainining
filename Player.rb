class Player  
  attr_reader :name
  def initialize(name, health = 100)  
   	@name = name  
   	@health = health
   	@found_treasure = { }
  end  
  
  def blam  
    @health = @health - 10 
  end  
  
  def w00t  
    @health = @health + 15
  end  

  def strong?
  	if @health > 100 
  		puts "my name is #{@name} and my health is > 100"
  	end
  end

  def to_s
    x = time
   	y = points
   	z = score
   	"I'm #{@name} with health = #{@health}, points = #{y}, and score =  #{z} as of #{x}"
  end

  def found_treasure(treasure)
  	@found_treasure[treasure.name] = treasure.points 
  end
  
  def points
     
    @total = 0
   	@found_treasure.each do | item, price |
		  @total = @total + price	
	   end
	   return @total
  end

  def score
    return @totalscore = @health + points
  end

  def time
    time = Time.new
   	x = "#{time.hour}:#{time.min}:#{time.sec}"
   	return x
  end
end  












