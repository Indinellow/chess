# frozen_string_literal: true

require_relative './board'
require_relative './chess_piece'
require_relative "./bishop"
require_relative "./king"
require_relative "./knight"
require_relative "./pawn"
require_relative "./queen"
require_relative "./rook"
require_relative "./colors.rb"
# class for the chess board where everything is going down
class ChessBoard
  attr_accessor :board 

  def initialize
    @board = create_empty_board
  end

  def create_empty_board
    Array.new(8) {Array.new(8) {nil}}
  end

  def display_curr_board
    temp = @board.reverse
    temp.each_with_index do |row,r_index|
      print 9 - (r_index + 1)
      row.each_with_index do |column, c_index|
        temp[r_index][c_index].is_a?(ChessPiece) ? icon = temp[r_index][c_index].icon : icon = '  '
        print (r_index+c_index)%2 == 0 ? (icon).bg_cyan : (icon).bg_brown
      end
      puts "\n"
    end
    puts " a b c d e f g h"
    puts "\n"
  end

  def insert_piece(piece)
    coords = piece.position_to_coordinates(piece.position)
    @board[coords[0]][coords[1]] = piece
  end

  def populate_new_board
    insert_pawns("white")
    insert_pawns("black")
    insert_knights
    insert_rooks
    insert_bishops
    insert_queens
    insert_kings
  end

  def insert_pawns(color)
    color == "white" ? row = 2 : row = 7
    8.times do |i|
      column = (97+i).chr
      pawn = Pawn.new("pawn",color,"#{column}#{row}",@board)
      insert_piece(pawn)
    end
  end

  def insert_knights
    positions = ["b1","g1","b8","g8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      knight = Knight.new("knight",colors[index],pos,@board)
      insert_piece(knight)
    end
  end

  def insert_bishops
    positions = ["c1","f1","c8","f8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      bishop = Bishop.new("bishop",colors[index],pos,@board)
      insert_piece(bishop)
    end
  end

  def insert_rooks
    positions = ["a1","h1","a8","h8"]
    colors = ["white","white","black","black"]
    positions.each_with_index do |pos, index|
      rook = Rook.new("rook",colors[index],pos,@board)
      insert_piece(rook)
    end
  end

  def insert_queens
    white_queen = Queen.new('queen','white',"d1",@board)
    insert_piece(white_queen) 
    black_queen = Queen.new('queen','black','d8',@board)
    insert_piece(black_queen)
  end

  def insert_kings
    white_king = King.new('king','white',"e1",@board)
    insert_piece(white_king) 
    black_king = King.new('king','black','e8',@board)
    insert_piece(black_king)
  end

  def move_piece(start_pos, end_pos)
    start_coords = position_to_coordinates(start_pos)
    end_coords = position_to_coordinates(end_pos)
    piece = @board[start_coords[0]][start_coords[1]]
    @board[end_coords[0]][end_coords[1]] = piece
    piece.position = end_pos
    @board[start_coords[0]][start_coords[1]] = nil
    piece.moved = true if piece.moved == false 
  end

  def position_to_coordinates(position = @position)
    position.split('')
    second = position[0].ord-97
    first = position[1].to_i - 1
    [first,second]   
  end
end

