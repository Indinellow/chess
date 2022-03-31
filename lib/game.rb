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
  end

  def populate_new_board
    insert_pawns("white")
    insert_pawns("black")
    insert_knights
    insert_rooks
    insert_bishops
    insert_queens
    insert_kings
    @chess_board.display_curr_board
  end

  def insert_pawns(color)
    color == "white" ? row = 2 : row = 7
    8.times do |i|
      column = (97+i).chr
      pawn = Pawn.new("pawn",color,"#{column}#{row}")
      @chess_board.insert_piece(pawn)
    end
  end

  def insert_knights
    positions = ["b1","g1","b8","g8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      knight = Knight.new("knight",colors[index],pos)
      @chess_board.insert_piece(knight)
    end
  end

  def insert_bishops
    positions = ["c1","f1","c8","f8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      bishop = Bishop.new("bishop",colors[index],pos)
      @chess_board.insert_piece(bishop)
    end
  end

  def insert_rooks
    positions = ["a1","h1","a8","h8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      rook = Rook.new("rook",colors[index],pos)
      @chess_board.insert_piece(rook)
    end
  end

  def insert_queens
    white_queen = Queen.new('queen','white',"d1")
    @chess_board.insert_piece(white_queen) 
    black_queen = Queen.new('queen','black','d8')
    @chess_board.insert_piece(black_queen)
  end

  def insert_kings
    white_king = King.new('king','white',"e1")
    @chess_board.insert_piece(white_king) 
    black_king = King.new('king','black','e8')
    @chess_board.insert_piece(black_king)
  end
end

new_game = Game.new
new_game.populate_new_board
