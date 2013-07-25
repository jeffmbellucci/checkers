#encoding: UTF-8
require  "./checker_board"
require "colorize"

TOKENS = { :standard => "O", :king => 'K'}


class Piece
  attr_accessor :pos
  attr_reader :color, :king
  
  def initialize(pos)
    @pos = pos
  end
  
end

p "piece d"