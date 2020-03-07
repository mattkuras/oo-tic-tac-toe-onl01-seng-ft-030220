require 'pry'
class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
  end
  
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
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i 
    input = input -1 
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    if index == 0..8 && !position_taken?(index)
      true 
    else
      false 
    end
  end
  
  def turn_count
     counter = 0 
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1 
    end 
  end
  counter
end
  
  def current_player
    if turn_count.even?
      current_player = "X"
    else
      current_player = "O"
    end
  end
      
  def turn
     puts "Please enter 1-9:"
     i = gets.strip
     index = input_to_index(i)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else
       turn
     end
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
     position_taken?(combo[0]) &&
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[0]] == @board[combo[2]]
  end
  end
  
  def full?
    unless @board.include?(" ")
    return true  
  else
    false
  end
end

  def draw? 
    if won?
      false
    else if 
      full? == false 
      false 
    else true
  end
end
end
  
  def over?
    if won? || full?
      true 
    end
  end
  
  def winner 
    if won? && current_player == "X"
      "O"
    else if won? && current_player == "O"
      "X"
    end
  end
end

def congrats 
  if winner == "X"
    puts "Congratulations X!"
    elsif winner == "O"
    puts "Congratulations O!"
    elsif draw? 
    puts "Cat's game!"
  end
end


  def play 
    unless over? 
    turn
    if over?
      congrats
    else
      turn 
    end
  end
end
   
  
end