board = [" "," "," "," "," "," "," "," "," "]

puts "請選出你要下棋的位置，請輸入 1-9："
input = gets.chomp
index = input.to_i - 1

board[index] = "X"

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
