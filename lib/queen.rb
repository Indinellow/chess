# frozen_string_literal: true

require_relative "chess_piece"

class Queen < ChessPiece
  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265B " : "\u265B ".black
  end
end