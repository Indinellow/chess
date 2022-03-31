# frozen_string_literal: true

# class for the chess board where everything is going down
class ChessBoard
  attr_accessor :board 

  def initialize
    @board = create_empty_board
  end

  def create_empty_board
    Array.new(8) {Array.new(8) {' '}}
  end

  def display_curr_board
    @board.each_with_index do |row,r_index|
      print 9 - (r_index + 1)
      row.each_with_index do |column, c_index|
        @board[r_index][c_index].is_a?(ChessPiece) ? icon = @board[r_index][c_index].icon : icon = ' '
        print (r_index+c_index)%2 == 0 ? (icon +' ').bg_gray : (icon+ ' ').bg_cyan
      end
      puts "\n"
    end
    puts " a b c d e f g h"
  end

  def insert_piece(piece)
    coords = piece.position_to_coordinates(piece.position)
    @board[coords[0]][coords[1]] = piece
  end
end

# modification to the String class so i can display background colors
class String 

  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
  def black;          "\e[30m#{self}\e[0m" end
end
