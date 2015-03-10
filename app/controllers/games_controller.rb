class GamesController < ApplicationController
  def index
    reset_pieces
    @coords = BoardSquare.all
  end

  def reset_pieces
    GamePiece.destroy_all

    coord11 = BoardSquare.where(row: 2, column: "a").first
    coord12 = BoardSquare.where(row: 2, column: "b").first
    coord13 = BoardSquare.where(row: 2, column: "c").first
    coord14 = BoardSquare.where(row: 2, column: "d").first
    coord15 = BoardSquare.where(row: 2, column: "e").first
    coord16 = BoardSquare.where(row: 2, column: "f").first
    coord17 = BoardSquare.where(row: 2, column: "g").first
    coord18 = BoardSquare.where(row: 2, column: "h").first

    coord21 = BoardSquare.where(row: 7, column: "a").first
    coord22 = BoardSquare.where(row: 7, column: "b").first
    coord23 = BoardSquare.where(row: 7, column: "c").first
    coord24 = BoardSquare.where(row: 7, column: "d").first
    coord25 = BoardSquare.where(row: 7, column: "e").first
    coord26 = BoardSquare.where(row: 7, column: "f").first
    coord27 = BoardSquare.where(row: 7, column: "g").first
    coord28 = BoardSquare.where(row: 7, column: "h").first

    GamePiece.create(name: "pawn", board_square_id: coord11.id)
    GamePiece.create(name: "pawn", board_square_id: coord12.id)
    GamePiece.create(name: "pawn", board_square_id: coord13.id)
    GamePiece.create(name: "pawn", board_square_id: coord14.id)
    GamePiece.create(name: "pawn", board_square_id: coord15.id)
    GamePiece.create(name: "pawn", board_square_id: coord16.id)
    GamePiece.create(name: "pawn", board_square_id: coord17.id)
    GamePiece.create(name: "pawn", board_square_id: coord18.id)

    GamePiece.create(name: "pawn", board_square_id: coord21.id)
    GamePiece.create(name: "pawn", board_square_id: coord22.id)
    GamePiece.create(name: "pawn", board_square_id: coord23.id)
    GamePiece.create(name: "pawn", board_square_id: coord24.id)
    GamePiece.create(name: "pawn", board_square_id: coord25.id)
    GamePiece.create(name: "pawn", board_square_id: coord26.id)
    GamePiece.create(name: "pawn", board_square_id: coord27.id)
    GamePiece.create(name: "pawn", board_square_id: coord28.id)
  end

end