
class Player

  attr_reader :name 
  

  def initialize(name)
    @name = name 
    @life = 3 
    @points = 0 
    puts "Welcome, Player #{@name}"
  end 
    
  # def get_answer_from_player(answer)
  #   @player_answer = answer
  #   #puts "your answer was #{@player_answer}"
  #   return @player_answer
  # end 

  def dead?
    # puts "#{name} is #{@life > 0 ? 'alive' : 'dead'}"
    @life <= 0
  end

  def gain_score
    @points += 1
    puts "Congrats, you have #{@points} points."
  end

  def lose_life
    @life -= 1
    puts "Player #{@name} has #{@life} lives left."
  end
  
  def life
    @life 
  end 

  def points
    @points
  end 

  def restart_life
    @life = 3
  end 
  # def dead?(name)
  #   if 
  # end 

end 

