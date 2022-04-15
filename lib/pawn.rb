# frozen_string_literal: true

require_relative "./chess_piece"
require_relative "./colors"

class Pawn < ChessPiece
  attr_accessor :move, :eat_move, :moveset

  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    @moveset = fill_moveset(color)
    super(name,color,position,board)    
  end

  def update_moveset
    if @moved 
      @moveset.delete([2,0])
      @moveset.delete([-2,0])
    end
  end

  def fill_moveset(color)
    move(color)
    eat_move(color)
    @move + @eat_move
  end

  def get_icon(color)
    color == "white" ? "\u265F ": "\u265F ".black
  end

  def move(color = @color)
    color == "white" ? @move =[[1,0],[2,0]] : @move = [[-1,0],[-2,0]]  
  end

  def eat_move(color = @color)
    color == "white" ? @eat_move = [[1,1],[1,-1]] : @eat_move = [[-1,-1],[-1,1]]
  end

  def move_forward_legal?(cur_coords,end_coords)
    return false unless @board[end_coords[0]][end_coords[1]].nil?
    
    unless @moved 
      return false unless @board[cur_coords[0]+1][cur_coords[1]].nil?
    end

    true
  end

  def move_eat_legal?(cur_coords,end_coords)
    return false if @board[end_coords[0]][end_coords[1]].nil?

    return true if @board[end_coords[0]][end_coords[1]].color != @color
    
    false 
  end

  def move_legal?(end_pos)
    update_moveset
    cur_coords = position_to_coordinates(@position)
    end_coords = position_to_coordinates(end_pos)
    wanted_move = [end_coords[0] - cur_coords[0],end_coords[1] - cur_coords[1]]
    return false unless @moveset.include?(wanted_move)

    return move_forward_legal?(cur_coords,end_coords) if @move.include?(wanted_move)

    return move_eat_legal?(cur_coords,end_coords) if @eat_move.include?(wanted_move)
    true 
  end
end