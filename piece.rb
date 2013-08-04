#encoding: UTF-8
require  "./checker_board"
require "colorize"

p "loading piece..."

TOKENS = { :standard => "◉", :king => "♛" }


class Piece
  attr_accessor :pos
  attr_reader :color, :king
  
  def initialize(pos, color, king = false)
    @pos = pos
    @color = color
    @king = king
  end
  
  def token
    return TOKENS[:king] if @king
    TOKENS[:standard]
  end
  
  def valid_move?(end_pos, board)
    to_x, to_y = end_pos
    delta_x = (to_x - @pos.first).abs
    delta_y = (to_y - @pos.last).abs
    return false unless delta_x == delta_y
    true
  end

end

