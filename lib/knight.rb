# frozen_string_literal: true

require_relative "chess_piece"

class Knight < ChessPiece
  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265E " : "\u265E ".black
  end
end