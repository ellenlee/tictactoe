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

checkmate = [] # 自己（X）差一格就贏
defence = []   # 別人（O）差一格就贏
possible = []  # 有 2 個空格 -- 還有可能連線

WIN_COMBINATIONS.each do |combo|

  x = []
  o = []
  space = []

  combo.each do |i|
    if board[i] == "X"
      x << i
    elsif board[i] == "O"
      o << i
    elsif board[i] == " "
      space << i
    end
  end

  print "x: #{x}, o: #{o}, space: #{space}\n"

  if x.length == 2 && space.length == 1
    checkmate << space[0]
  end

  if o.length == 2 && space.length == 1
    defence << space[0]
  end

  if x.length == 1 && space.length == 2
    space.each do |s|
      possible << s
    end
  end

end
puts "checkmate: #{checkmate}"
puts "defence: #{defence}"
puts "possible: #{possible}"
