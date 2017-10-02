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

# 棋盤與棋步
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = ["X","X","O"," "," "," "," "," ","O"]
display_board(board)

def avail_position(board)
  avail_position = Array.new

  board.each_with_index do |input, index|
    if input == " "
      avail_position << index
      # 上面程式碼等同於 avail_position.push(index)
    end
  end
  avail_position
end

puts "目前可用位置：#{avail_position(board)}"

checkmate = [] # 電腦（O）差一格就贏
defence = []   # 人類（X）差一格就贏
possible = []  # 有 2 個空格 -- 還有可能連線

WIN_COMBINATIONS.each do |combo|
  avail_position = avail_position(board)
  potential_choice = combo & avail_position
  taken_position = combo - potential_choice
  line_combo = taken_position.map {|i| board[i]}

  puts "#{combo}:#{potential_choice}"
  puts "#{line_combo}"
  puts "length: #{potential_choice.length}"

  if potential_choice.length == 1
    if line_combo[0] == "O" && line_combo[1] == "O"
      checkmate << potential_choice[0]
    elsif line_combo[0] == "X" && line_combo[1] == "X"
      defence << potential_choice[0]
    end
  elsif potential_choice.length == 2
    if line_combo[0] == "O"
      potential_choice.each do |choice|
        possible << choice
      end
    end
  end
end

#
# WIN_COMBINATIONS.each do |combo|
#   o = []
#   x = []
#   space = []
#
#   combo.each do |i|
#     if board[i] == "O"
#       o << i
#     elsif board[i] == "X"
#       x << i
#     elsif board[i] == " "
#       space << i
#     end
#   end
#
#   print "x: #{x}, o: #{o}, space: #{space}\n"
#
#   if o.length == 2 && space.length == 1
#     checkmate << space[0]
#   end
#
#   if x.length == 2 && space.length == 1
#     defence << space[0]
#   end
#
#   if o.length == 1 && space.length == 2
#     space.each do |s|
#       possible << s
#     end
#   end
# end
puts "checkmate: #{checkmate}"
puts "defence: #{defence}"
puts "possible: #{possible}"

if checkmate.any?
  puts "checkmate: #{checkmate.sample}"
  return checkmate.sample
elsif defence.any?
  puts "defence: #{defence.sample}"
  return defence.sample
elsif possible.any?
  puts "possible: #{possible.sample}"
  return possible.sample
else
  puts "random: #{avail_position(board).sample}"
  return avail_position(board).sample
end
