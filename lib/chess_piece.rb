# frozen_string_literal:true
 require_relative './board'
# class that holds all chess pieces, each chess piece is a subclass of this class
class ChessPiece
  attr_accessor :icon, :position, :color

  def initialize (name, color ,position)
    @position = position
    @color = color
    @icon = get_icon(name,color)
  end

  def get_icon(name,color)
    icons = get_color_icons(name)
    color == "white" ? icons[0] : icons[1]
  end

  def get_color_icons(name)
    case name
    when "pawn"
      ["\u2659","\u265F"]
    when "rook"
      ["\u2656","\u265C"]
    when "bishop"
      ["\u2657","\u265D"]
    when "knight"
      ["\u2658","\u265E"]
    when "king"
      ["\u2654","\u265A"]
    when "queen"
      ["\u2655","\u265B"]
    end
  end
  # b1 -> [7,1], a1 -> [7,0], d8 -> [0,3] 
  def position_to_coordinates(position = @position)
    position.split('')
    second = position[0].ord-97
    first = 7- (position[1].to_i - 1)
    [first,second]   
  end
end