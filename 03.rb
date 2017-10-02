
# 棋盤與棋步
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  puts "請選出你要下棋的位置，請輸入 1-9："
  input = gets.chomp
  index = input.to_i - 1

  if valid_move?(board, index)
    move(board, index)
  else
    play(board)
  end
end

def valid_move?(board, index)
  (0..8).include?(index) && board[index] == " "
end

def move(board, index)
  board[index] = current_player(board)
  display_board(board)
end

# 兩人輪流

def turn(board)
  while turn_count(board) <= 9
    puts "第 #{turn_count(board)} 回合，輪到 #{current_player(board)}"
    play(board)
  end
  puts "遊戲結束"
end

def turn_count(board)
  counter = 1
  board.each do |i|
    if i != " "
      counter = counter + 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 1
    current_player = "X"
  else
    current_player = "O"
  end
end

# 執行程序

board = [" "," "," "," "," "," "," "," "," "]

display_board(board)
turn(board)
