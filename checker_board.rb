#encoding: UTF-8
require"./piece"
require 'colorize'

p "Board loading..."

class Board
  
  def initialize
    init_board
  end
  
  def init_board
    @board = []
    8.times do |row|
      @board << []
      8.times do |col|
        @board[row] += [nil]
      end
    end
    @board[6][3] = :h 
  end
  
  def draw_board
    8.times do |row|
      puts"\n"
      8.times do |col|
        draw_square(@board, row, col) 
      end
    end
  end
    
  def  draw_square(board, row, col)
    if @board[col][row].nil?
      print "  ".colorize(:background => :red) if (row + col).even?
      print "  ".colorize(:background => :blue) if (row + col).odd?
    else 
      print " #{@board[col][row]}"
    end
  end
  
    
  #p @board
end
        

