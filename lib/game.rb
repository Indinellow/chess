# frozen_string_literal: true

require_relative './board'
require_relative './chess_piece'
require_relative "./bishop"
require_relative "./king"
require_relative "./knight"
require_relative "./pawn"
require_relative "./queen"
require_relative "./rook"

#class that plays the game once 
class Game
  attr_accessor :chess_board
  def initialize
    @chess_board = ChessBoard.new
    start_new_game
  end

  def position_to_coordinates(position = @position)
    position.split('')
    second = position[0].ord-97
    first = position[1].to_i - 1
    [first,second]   
  end

  def pick_piece(position)
    coords = position_to_coordinates(position)
    @chess_board.board[coords[0]][coords[1]]
  end

  def start_new_game
    @chess_board.populate_new_board
    @chess_board.display_curr_board
  end
end

new_game = Game.new
new_game.chess_board.move_piece("d2","d6")
new_game.chess_board.display_curr_board
p new_game.pick_piece("c2").move_legal?("d3")