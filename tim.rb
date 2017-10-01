def display_board(board)
	puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
	puts "----------"
	puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
	puts "----------"
	puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
end

#Test if someone wins
def judgement(board)
	case 
	when @board[0] == @board[1] && @board[0] == @board[2] && @board[1] == @board[2] && true
		game_result = true		
	when @board[3] == @board[4] && @board[4] == @board[5] && @board[3] == @board[4] && true
		game_result = true
	when @board[6] == @board[7] && @board[7] == @board[8] && @board[6] == @board[8] && true
		game_result = true		
	when @board[0] == @board[3] && @board[0] == @board[6] && @board[3] == @board[6] && true
		game_result = true
	when @board[1] == @board[4] && @board[4] == @board[7] && @board[1] == @board[7] && true
		game_result = true
	when @board[2] == @board[5] && @board[2] == @board[8] && @board[5] == @board[8] && true
		game_result = true
	when @board[0] == @board[4] && @board[0] == @board[8] && @board[4] == @board[8] && true
		game_result = true
	when @board[2] == @board[4] && @board[2] == @board[6] && @board[4] == @board[6] && true
		game_result = true
	else
		game_result = false	
	end
end

#Computer test it's the next step 
def judgement_test(board_test)
	case 
	when @board_test[0] == @board_test[1] && @board_test[0] == @board_test[2] && @board_test[1] == @board_test[2] && true
		game_result = true		
	when @board_test[3] == @board_test[4] && @board_test[4] == @board_test[5] && @board_test[3] == @board_test[4] && true
		game_result = true
	when @board_test[6] == @board_test[7] && @board_test[7] == @board_test[8] && @board_test[6] == @board_test[8] && true
		game_result = true		
	when @board_test[0] == @board_test[3] && @board_test[0] == @board_test[6] && @board_test[3] == @board_test[6] && true
		game_result = true
	when @board_test[1] == @board_test[4] && @board_test[4] == @board_test[7] && @board_test[1] == @board_test[7] && true
		game_result = true
	when @board_test[2] == @board_test[5] && @board_test[2] == @board_test[8] && @board_test[5] == @board_test[8] && true
		game_result = true
	when @board_test[0] == @board_test[4] && @board_test[0] == @board_test[8] && @board_test[4] == @board_test[8] && true
		game_result = true
	when @board_test[2] == @board_test[4] && @board_test[2] == @board_test[6] && @board_test[4] == @board_test[6] && true
		game_result = true
	else
		game_result = false	
	end
end

#Put "O" or "X" on the board (The first player will use "O")
def go_ttt
	if @count % 2 == 0
		@board[@board.index(@input.to_i)] = "O"
		display_board(@board)
		@count = @count + 1
		@board_count.delete(@input.to_i)
	else
		@board[@board.index(@input.to_i)] = "X"
		display_board(@board)
		@count = @count + 1
		@board_count.delete(@input.to_i)
	end	
end

#define how user play the game
def user_play
	print "where would you like to go? Please enter a number: (or enter exit to leave the game) "
	@input = gets.chomp
	puts "You enter: #{@input}"

	if @board.index(@input.to_i) != nil
		go_ttt
	elsif @input == "exit"
		puts "You exit my game QQ"
		return
	else 	
		puts "Sorry please enter again"
	end
end

#defind how computer play the game
def pc_play
	puts "Computer player says: 'It's my turn!'"	
#best position for the first step

	if @board[4] == 5
		@input = 5
		puts "I go #{@input} of course"
	else
		pc_check = false

#attack: try to win
		if @first == "y"  # pc use "X"
			for i in 0..@board_count.length-1
				@board_test = @board.clone
				if pc_check == false
					@input = @board_count[i]
					@board_test[@board_test.index(@input.to_i)] = "X"
					if judgement_test(@board_test) == true
						pc_check = true
					end	
				end	
			end
		else # pc use "O"
			for i in 0..@board_count.length-1
				@board_test = @board.clone
				if pc_check == false
					@input = @board_count[i]
					@board_test[@board_test.index(@input.to_i)] = "O"
					if judgement_test(@board_test) == true
						pc_check = true
					end	
				end	
			end
		end	

#defence: try no to lose		
		if @first == "y"  # pc use "X"
			for i in 0..@board_count.length-1
				@board_test = @board.clone
				if pc_check == false
					@input = @board_count[i]
					@board_test[@board_test.index(@input.to_i)] = "O"
					if judgement_test(@board_test) == true
						pc_check = true
					end	
				end	
			end
		else # pc use "O"
			for i in 0..@board_count.length-1
				@board_test = @board.clone
				if pc_check == false
					@input = @board_count[i]
					@board_test[@board_test.index(@input.to_i)] = "X"
					if judgement_test(@board_test) == true
						pc_check = true
					end	
				end	
			end
		end	
#I have question here: too much duplicate code
#random
		if pc_check == false
			@input = @board_count.sample
			puts "I go #{@input} for random"
		end	
	end	
	go_ttt
end	

#Welcome message
puts "Welcome to my Tic-Tac-Toe game!"
puts "You will play with computer, are you ready?"
print "What's your name? "
input_name = gets
name = input_name.chomp
puts "Welcome #{name}!"


#User can choose go first or later
user_answer = false
until user_answer == true
	print "Do you want start first? (y/n) "
	input_first = gets
	@first = input_first.chomp
	case 
	when @first == "y"
		user_answer = true
	when @first == "n"
		user_answer = true
	else
		puts "Please enter 'y' or 'n'"
		user_answer = false		
	end
end

#Set up the game

@board = [1,2,3,4,5,6,7,8,9]
@board_count = @board.clone
game_result = false             #I have question here
@count = 0
display_board(@board)

#Start playing here
until @count == 9
	if judgement(@board) == true
		if @first == "y" && @count % 2 == 0
			puts "Computer Player wins!"
			break
		elsif @first == "y" && @count % 2 == 1
			puts "#{name} wins!"
			break
		elsif @first == "n" && @count % 2 == 0
			puts "#{name} wins!"
			break
		else
			puts "Computer Player wins!"
			break			
		end
	else
		if @first == "y" && @count % 2 == 0
			user_play
		elsif @first == "y" && @count % 2 == 1
			pc_play
		elsif @first == "n" && @count % 2 == 0
			pc_play
		else
			user_play				
		end

	end	
end

if @count == 9 && judgement(@board) == false
	puts "Wow! No one wins. You two are well-matched!"	
end