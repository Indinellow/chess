# frozen_string_literal: true

require_relative "chess_piece"

class King < ChessPiece

  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265A ": "\u265A ".black
  end
end