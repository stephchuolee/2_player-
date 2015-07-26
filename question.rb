
class Question

  def initialize
    operators = [:+, :-, :*] # leave division for later
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @op = operators.sample
    @correct_answer = @number1.send(@op, @number2) # @number1 @op @number2 # @number1.+(@number2) <-- neither will work 
    # easier than
    # case @op
    # when :+ @ then @number1 + @number2
    # when :- ...
    # end
    # 1 + 2 === 1.send(:+, 2)
    # 5 * 3 === 5.send(:*, 3)
  end 

  def to_s #ask to string 
    "What is #{@number1} #{@op} #{@number2}?".blue
  end  

  def show_correct_answer    
    puts "The correct answer was #{@correct_answer}".green
    # return @correct_answer
  end 

  def verify_answer(player_answer)
    if player_answer == @correct_answer
      puts "Your answer is correct".green
      true
    else
      puts "Your answer is incorrect. You have lost a life.".red
      show_correct_answer
      false 
    end 
  end 

end 
