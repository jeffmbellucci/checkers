#encoding: UTF-8
require "./piece"
require "./interface"
require 'colorize'

p "Board loading..."

class Board
  include Interface
  
  def initialize
    init_board
    fill_board
  end
  
  
  def draw_board
    8.times { |i| print " #{LETTERS[i]}"}
    8.times do |row|
      puts"\n"
      print row
      8.times do |col|
        draw_square(col, row) 
      end
    end
  end
  
  def play
    turns = 0
    loop do 
      draw_board
      turns += 1
      move = get_user_move
      start = move.first
      finish = move.last
      piece = get_piece_at(start)
      if piece && piece.valid_move?(finish, self)
        move!(start, finish)
      else
        puts "Cant make that move!!!"
      end
      
      
      break if turns > 5
    end
    
  end
  
  def get_piece_at(pos)
    x, y = pos
    @board[x][y]
  end
    
  
  def move!(start, finish)
    from_x, from_y = start
    to_x, to_y = finish
    piece = @board[from_x][from_y]
    piece.pos = finish
    @board[to_x][to_y] = piece
    @board[from_x][from_y] = nil
  end
  
  
  
       
  private

  def fill_board
    8.times do |row| 
      8.times do |col|
        if row < 3 && (row + col).even?
          @board[col][row] = Piece.new([col, row], :white)
        elsif row > 4 && (row + col).even?
          @board[col][row] = Piece.new([col, row], :black)
        end
      end
    end
  end
    
  def  draw_square(row, col)
    back = :red if (row + col).even?
    back = :light_red if (row + col).odd?
    if @board[row][col].nil?
      print "  ".colorize(:background => back)
    else 
      color, token = @board[row][col].color, @board[row][col].token
      print "#{token} ".colorize(:color => color).colorize(:background => back)
    end
  end
  
  def init_board
    @board = []
    8.times do |row|
      @board << []
      8.times do |col|
        @board[row] += [nil]
      end
    end
  end
  
end
        

