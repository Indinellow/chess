# frozen_string_literal: true

require_relative "chess_piece"
class Rook < ChessPiece

  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265C " : "\u265C ".black
  end

end