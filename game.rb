
@number1 = 0
@number2 = 0
@user_life = [3,3] 
@user_points = [0,0] 
@current_user = 0



  def generate_question
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    puts "What is #{@number1} + #{@number2}?"
  end 


  def verify_answer(current_user, user_answer)
    if user_answer == @number1 + @number2  
      @user_points[current_user] += 1
     # puts "You have earned one point. You now have #{@user_points[current_user]} points."
    else 
      @user_life[current_user] -= 1
    end 
  end 

  def player_dead?(current_user)
    @user_life[current_user] == 0
  end 

  def score 
    puts "Player 1 has #{@user_points[0]} points and #{@user_life[0]} lives"
    puts "Player 2 has #{@user_points[1]} points and #{@user_life[1]} lives"
  end 

  def player_swap
    if @current_user == 0
      @current_user = 1
    else
      @current_user = 0
    end   
  end 

while true 
  generate_question 
  @current_answer = gets.chomp.to_i
  verify_answer(@current_user, @current_answer)
  if player_dead?(@current_user) 
    puts "You have lost, Player #{@current_user+1}. You scored #{@user_points[@current_user]} points."
    player_swap 
    puts "Player #{@current_user +1 } has won! You scored #{@user_points[@current_user]} points."
    break 
  else 
    score 
  end 
  player_swap 
end 





