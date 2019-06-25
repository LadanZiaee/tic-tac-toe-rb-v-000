WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |count|
    if count == "X" || count == "O"
    turn += 1 
  end
  end
  turn
end

def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] && 
    position_taken?(board, combo[0])
 end
end

def full?(board)
  board.all?{|full| full == "X" || full == "O"}
end

def draw?(board)
  if full?(board) && !won?(board) 
    true
  end
end

def over?(board)
  if full?(board) && won?(board)
    true
    elsif draw?(board)
    true
    elsif won?(board) && !full?(board)
    true
  end
end

def winner (board)
  index = won?(board)
    if board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
    elsif board
      return nil
    end
end