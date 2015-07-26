
require './player.rb'
require './question.rb'
require 'pry'
require 'colorize'

class Game 

  def initialize(num_players)
    @players = [] #array of player objects 
    @round = 0
    num_players.times do |x|
      print "Player #{x+1}, what is your name? "
      name = gets.chomp
      @players << Player.new(name)
    end
  end

  def can_play?
    # @players.collect { |player| player.alive? }.count > 1
    @players.reject(&:dead?).count > 1 # does same as above, shorthand for checking a property on an object
  end

  def current_player
    @players[@round % @players.length]
  end

  def next_round #goes to next alive player
    while true 
      @round += 1
      break unless current_player.dead? # Skip rounds for dead players == break if player alive 
    end
  end

  def play
    while can_play? do 
      question = Question.new
      puts question
      print "#{current_player.name}, what is your answer? "
      answer = gets.chomp.to_i
      if(question.verify_answer(answer))
        current_player.gain_score
      else
        current_player.lose_life
      end
      next_round
    end
  end

  def report
    @players.each do |player|
      if player.life > 0
        puts "Congrats, #{player.name} you have #{player.points} points.".green
      else 
        puts "You lost #{player.name} , you have #{player.points} points.".red
      end 
    end 
  end

  def restart(&block)
    puts "Would you like to play again? Yes or No?".yellow
    restart = gets.chomp.to_s.downcase
      if restart == "yes" 
        @players.each do |player|
           player.restart_life
           puts "You now have #{player.life} lives."
        end 
      yield

      else
        return false
      end
  end 


end 

print "How many players are there? "
game = Game.new(gets.chomp.to_i)

game.play
puts "GAME OVER".yellow
game.report


while true 
  game.restart{game.play}
  game.report
  puts "Do you want to quit?"
  answer = gets.chomp.downcase.to_s
  break if answer == "yes" 
end



  






