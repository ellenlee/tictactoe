# 遊戲的結果

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def won?(board)
  return false if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end

  false
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def full?(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end

  (counter == 9)? true : false
  # if counter == 9
  #   return true
  # else
  #   false
  # end

end

def winner(board)
  if won?(board)
    winner_board = won?(board)
    return board[winner_board[0]]
  end
end

# 執行遊戲

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "------------\n恭喜 #{winner(board)} 贏得勝利!\n------------\n"
  elsif draw?(board)
    puts "------------\n平手!\n------------\n"
  end
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  elsif turn_count(board).odd?
    current_player = "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  counter
end

# 落點

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


# 棋盤
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" "," "," "," "," "," "," "," "," "]

puts "Welcome to Tic Tac Toe!"
puts "Where would you like to go?"

display_board(board)
play(board)
