# frozen_string_literal:true
 require_relative './board'
 require_relative './colors'
 
# class that holds all chess pieces, each chess piece is a subclass of this class
class ChessPiece
  attr_accessor :icon, :position, :color, :board, :moved, :coordinates

  def initialize (name, color ,position, board=nil)
    @position = position
    @coordinates = position_to_coordinates(@position)
    @color = color
    @board = board
    @moved = false
  end

  # d2 -> [2,3] 
  def position_to_coordinates(position = @position)
    position.split('')
    second = position[0].ord-97
    first = position[1].to_i - 1
    [first,second]   
  end
end