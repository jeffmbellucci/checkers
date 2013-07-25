#encoding: UTF-8
require  "./checker_board"
require "colorize"

p "loading piece..."

TOKENS = { :standard => "✪", :king => "♛" }


class Piece
  attr_accessor :pos
  attr_reader :color, :king
  
  def initialize(pos, color, king = false)
    @pos = pos
    @color = color
    @king = king
  end
  
  def token
    return TOKENS[:king] if king
    TOKENS[:standard]
  end
end

