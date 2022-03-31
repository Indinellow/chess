# frozen_string_literal: true

require_relative "chess_piece"

class Pawn < ChessPiece

  def allowed_moveset(color = @color)
    color == white ? @moveset =[[0,1]] : [[0,-1]]  
  end

end