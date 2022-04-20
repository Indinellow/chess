# frozen_string_literal: true

require_relative "chess_piece"

class Queen < ChessPiece

  attr_accessor :moveset

  def initialize(name, color ,position, board=nil)
    @icon = get_icon(color)
    @moveset = []
    super(name,color,position,board)
  end

  def get_icon(color)
    color == "white" ? "\u265B " : "\u265B ".black
  end

  def in_board?(x,y,x_axis,y_axis)
    (x+x_axis).between?(0,7) && (y+y_axis).between?(0,7)
  end

  def fill_direction(x_axis,y_axis)
    cur_coords = position_to_coordinates(@position)
    i = 1
    while  in_board?(cur_coords[0],cur_coords[1],x_axis,y_axis) && @board[cur_coords[0]+x_axis][cur_coords[1]+y_axis].nil?
      @moveset << [i * x_axis,i * y_axis]
      i += 1
      cur_coords[0]+= x_axis
      cur_coords[1]+= y_axis
    end 
    @moveset << [i * x_axis,i * y_axis] if !@board[cur_coords[0]+x_axis][cur_coords[1]+y_axis].nil? && @board[cur_coords[0]+x_axis][cur_coords[1]+y_axis].color != @color
  end

  def fill_moveset
    @moveset = []
    fill_direction(1,1)
    fill_direction(-1,-1)
    fill_direction(1,-1)
    fill_direction(-1,1)
    fill_direction(1,0)
    fill_direction(-1,0)
    fill_direction(0,1)
    fill_direction(0,-1)
    
  end

  def move_legal?(end_pos)
    fill_moveset

    cur_coords = position_to_coordinates(@position)
    end_coords = position_to_coordinates(end_pos)
    wanted_move = [end_coords[0] - cur_coords[0],end_coords[1] - cur_coords[1]]

    @moveset.include?(wanted_move)
  end
end