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

def play(board)
  if current_player(board) == "X"
    puts   puts "請選出你要下棋的位置，請輸入 1-9："
    input = gets.chomp
    index = input.to_i - 1
  else
    puts "換電腦下棋"
    index = computer_play(board)
  end

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
  while turn_count(board) <= 9 && !won?(board)
    puts "\n第 #{turn_count(board)} 回合，輪到 #{current_player(board)}"
    play(board)
  end

  if won?(board)
    puts "#{winner(board)} 贏了！"
  else
    puts "平手！沒有人贏！"
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
    return "X"
  else
    return "O"
  end
end

# 判斷輸贏

def won?(board)
  # 如果有滿足到贏的組合，就回傳 True
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end

  # 如果都沒人贏，就回傳 False
  return false
end

def winner(board)
  win_combo = won?(board)
  if win_combo
    winner = board[win_combo[0]]
    return winner
  end
end

# 電腦選棋

def computer_play(board)
  best_choice(board)
end

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

def best_choice(board)
  avail_position = avail_position(board)

  checkmate = [] # 電腦（O）差一格就贏
  defence = []   # 人類（X）差一格就贏
  possible = []  # 有 2 個空格 -- 還有可能連線

  WIN_COMBINATIONS.each do |combo|
    empty = combo & avail_position
    taken = combo - empty
    line_combo = taken.map {|i| board[i]}

    if empty.length == 1
      if line_combo[0] == "O" && line_combo[1] == "O"
        checkmate << empty[0]
      elsif line_combo[0] == "X" && line_combo[1] == "X"
        defence << empty[0]
      end
    elsif empty.length == 2
      if line_combo[0] == "O"
        empty.each do |choice|
          possible << choice
        end
      end
    end
  end

  if checkmate.any?
    return checkmate.sample
  elsif defence.any?
    return defence.sample
  elsif possible.any?
    return possible.sample
  else
    return avail_position.sample
  end
end

# 執行程序

board = [" "," "," "," "," "," "," "," "," "]
# 上面程式碼等同於 Array.new(9, ' ')

display_board(board)
turn(board)
