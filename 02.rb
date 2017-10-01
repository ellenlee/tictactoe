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
  board[index] = "X"
  display_board(board)
end

board = [" "," "," "," "," "," "," "," "," "]

display_board(board)
play(board)
