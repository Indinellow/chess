# frozen_string_literal: true

require_relative "chess_piece"

class Knight < ChessPiece

  attr_accessor :moveset

  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    @moves = [[1,2], [2,1] ,[2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
    @moveset = []
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265E " : "\u265E ".black
  end

  def fill_moveset
    @moveset = []
    @moves.each do |move|
      in_board = (@coordinates[0]+move[0]).between?(0,7) && (@coordinates[1]+move[1]).between?(0,7) 
      not_own_piece = @board[@coordinates[0]+move[0]][@coordinates[1]+move[1]].nil? || @board[@coordinates[0]+move[0]][@coordinates[1]+move[1]].color != @color
      @moveset << move if in_board && not_own_piece
    end
  end

  def move_legal?(end_pos)
    fill_moveset
    cur_coords = position_to_coordinates(@position)
    end_coords = position_to_coordinates(end_pos)
    wanted_move = [end_coords[0] - cur_coords[0],end_coords[1] - cur_coords[1]]

    @moveset.include?(wanted_move)
  end
end