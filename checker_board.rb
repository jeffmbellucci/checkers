#encoding: UTF-8
require"./piece"
require 'colorize'

p "Board loading..."

class Board
  LETTERS = ("A".."H").to_A
  
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
    @board[6][3] = Piece.new([6, 3], :white, true) 
  end
  
  
  def draw_board
    8.times { |i| print " #{i}" } # print " #{LETTERS[i]}"}
    8.times do |row|
      puts"\n"
      print row
      8.times do |col|
        draw_square(col, row) 
      end
    end
  end
    
  def  draw_square(row, col)
    back = :red if (row + col).even?
    back = :blue if (row + col).odd?
    if @board[row][col].nil?
      print "  ".colorize(:background => back)
    else 
      color, token = @board[row][col].color, @board[row][col].token
      print "#{token} ".colorize(:color => color).colorize(:background => back)
    end
  end
  
    
  #p @board
end
        

