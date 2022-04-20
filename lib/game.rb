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
# new_game.chess_board.move_piece("a1","f4")
# new_game.chess_board.move_piece("c7","c4")
# new_game.chess_board.display_curr_board
# new_game.pick_piece("f4").fill_moveset
# p new_game.pick_piece("f4").moveset

# testing for bishop movement
# new_game.chess_board.move_piece("c1","d4")
# new_game.chess_board.move_piece("f7","f6")
# new_game.chess_board.move_piece("c7","c5")
# new_game.chess_board.display_curr_board
# new_game.pick_piece("d4").fill_moveset
# p new_game.pick_piece("d4").moveset

# testing for queen movement
# new_game.chess_board.move_piece("d1","e5")
# new_game.chess_board.move_piece("f7","f6")
# new_game.chess_board.move_piece("c7","c5")
# new_game.chess_board.display_curr_board
# new_game.pick_piece("e5").fill_moveset
# p new_game.pick_piece("e5").moveset

# testing for knight movement
# new_game.chess_board.move_piece("b8","a5")
# new_game.chess_board.display_curr_board
# new_game.pick_piece("a5").fill_moveset
# p new_game.pick_piece("a5").moveset

