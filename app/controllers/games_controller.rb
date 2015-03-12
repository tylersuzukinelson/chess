class GamesController < ApplicationController

  def index
    GamePiece.destroy_all
    reset_pawn
    reset_rook
    reset_knight
    reset_bishop
    reset_king
    reset_queen
    @coords = BoardSquare.all
  end

  private

  def reset_pawn
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
    coord28 = BoardSquare.where(row: 5, column: "h").first

    coord29 = BoardSquare.where(row: 8, column: "e").first

    GamePiece.create(name: "black-pawn", board_square_id: coord11.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord12.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord13.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord14.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord15.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord16.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord17.id)
    GamePiece.create(name: "black-pawn", board_square_id: coord18.id)

    GamePiece.create(name: "white-pawn", board_square_id: coord21.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord22.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord23.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord24.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord25.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord26.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord27.id)
    GamePiece.create(name: "white-pawn", board_square_id: coord28.id)

    #GamePiece.create(name: "white-king", board_square_id: coord29.id)
  end

  def reset_rook
    coord1 = BoardSquare.first
    coord2 = BoardSquare.where(row: 1, column: "h").first
    coord3 = BoardSquare.where(row: 8 , column: "a").first
    coord4 = BoardSquare.last

    GamePiece.create(name: "black-rook", board_square_id: coord1.id)
    GamePiece.create(name: "black-rook", board_square_id: coord2.id)
    GamePiece.create(name: "white-rook", board_square_id: coord3.id)
    GamePiece.create(name: "white-rook", board_square_id: coord4.id)
  end

  def reset_knight
    coord1 = BoardSquare.where(row: 1, column: "b").first
    coord2 = BoardSquare.where(row: 1, column: "g").first
    coord3 = BoardSquare.where(row: 8, column: "b").first
    coord4 = BoardSquare.where(row: 8, column: "g").first

    GamePiece.create(name: "black-knight", board_square_id: coord1.id)
    GamePiece.create(name: "black-knight", board_square_id: coord2.id)
    GamePiece.create(name: "white-knight", board_square_id: coord3.id)
    GamePiece.create(name: "white-knight", board_square_id: coord4.id)
  end

  def reset_bishop
    coord1 = BoardSquare.where(row: 1, column: "c").first
    coord2 = BoardSquare.where(row: 1, column: "f").first
    coord3 = BoardSquare.where(row: 8, column: "c").first
    coord4 = BoardSquare.where(row: 8, column: "f").first

    GamePiece.create(name: "black-bishop", board_square_id: coord1.id)
    GamePiece.create(name: "black-bishop", board_square_id: coord2.id)
    GamePiece.create(name: "white-bishop", board_square_id: coord3.id)
    GamePiece.create(name: "white-bishop", board_square_id: coord4.id)
  end

  def reset_queen
    coord1 = BoardSquare.where(row: 1, column: "d").first
    coord2 = BoardSquare.where(row: 8, column: "d").first

    GamePiece.create(name: "black-queen", board_square_id: coord1.id)
    GamePiece.create(name: "white-queen", board_square_id: coord2.id)
  end

  def reset_king
    coord1 = BoardSquare.where(row: 1, column: "e").first
    coord2 = BoardSquare.where(row: 8, column: "e").first

    GamePiece.create(name: "black-king", board_square_id: coord1.id)
    GamePiece.create(name: "white-king", board_square_id: coord2.id)
  end


end