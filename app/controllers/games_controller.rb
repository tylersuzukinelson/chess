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
    coord28 = BoardSquare.where(row: 7, column: "h").first

    #coord29 = BoardSquare.where(row: 8, column: "e").first

    GamePiece.create(name: "black-pawn", board_square: coord11, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord12, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord13, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord14, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord15, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord16, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord17, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))
    GamePiece.create(name: "black-pawn", board_square: coord18, :avatar => File.new("#{Rails.root}/app/assets/images/black-pawn.png"))

    GamePiece.create(name: "white-pawn", board_square: coord21, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord22, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord23, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord24, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord25, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord26, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord27, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))
    GamePiece.create(name: "white-pawn", board_square: coord28, :avatar => File.new("#{Rails.root}/app/assets/images/white-pawn.png"))

    #GamePiece.create(name: "white-king", board_square: coord29)
  end

  def reset_rook
    coord1 = BoardSquare.first
    coord2 = BoardSquare.where(row: 1, column: "h").first
    coord3 = BoardSquare.where(row: 8 , column: "a").first
    coord4 = BoardSquare.last

    GamePiece.create(name: "black-rook", board_square: coord1, :avatar => File.new("#{Rails.root}/app/assets/images/black-rook.png"))
    GamePiece.create(name: "black-rook", board_square: coord2, :avatar => File.new("#{Rails.root}/app/assets/images/black-rook.png"))
    GamePiece.create(name: "white-rook", board_square: coord3, :avatar => File.new("#{Rails.root}/app/assets/images/white-rook.png"))
    GamePiece.create(name: "white-rook", board_square: coord4, :avatar => File.new("#{Rails.root}/app/assets/images/white-rook.png"))
  end

  def reset_knight
    coord1 = BoardSquare.where(row: 1, column: "b").first
    coord2 = BoardSquare.where(row: 1, column: "g").first
    coord3 = BoardSquare.where(row: 8, column: "b").first
    coord4 = BoardSquare.where(row: 8, column: "g").first

    GamePiece.create(name: "black-knight", board_square: coord1, :avatar => File.new("#{Rails.root}/app/assets/images/black-knight.png"))
    GamePiece.create(name: "black-knight", board_square: coord2, :avatar => File.new("#{Rails.root}/app/assets/images/black-knight.png"))
    GamePiece.create(name: "white-knight", board_square: coord3, :avatar => File.new("#{Rails.root}/app/assets/images/white-knight.png"))
    GamePiece.create(name: "white-knight", board_square: coord4, :avatar => File.new("#{Rails.root}/app/assets/images/white-knight.png"))
  end

  def reset_bishop
    coord1 = BoardSquare.where(row: 1, column: "c").first
    coord2 = BoardSquare.where(row: 1, column: "f").first
    coord3 = BoardSquare.where(row: 8, column: "c").first
    coord4 = BoardSquare.where(row: 8, column: "f").first

    GamePiece.create(name: "black-bishop", board_square: coord1, :avatar => File.new("#{Rails.root}/app/assets/images/black-bishop.png"))
    GamePiece.create(name: "black-bishop", board_square: coord2, :avatar => File.new("#{Rails.root}/app/assets/images/black-bishop.png"))
    GamePiece.create(name: "white-bishop", board_square: coord3, :avatar => File.new("#{Rails.root}/app/assets/images/white-bishop.png"))
    GamePiece.create(name: "white-bishop", board_square: coord4, :avatar => File.new("#{Rails.root}/app/assets/images/white-bishop.png"))
  end

  def reset_queen
    coord1 = BoardSquare.where(row: 1, column: "d").first
    coord2 = BoardSquare.where(row: 8, column: "d").first

    GamePiece.create(name: "black-queen", board_square: coord1, :avatar => File.new("#{Rails.root}/app/assets/images/black-queen.png"))
    GamePiece.create(name: "white-queen", board_square: coord2, :avatar => File.new("#{Rails.root}/app/assets/images/white-queen.png"))
  end

  def reset_king
    coord1 = BoardSquare.where(row: 1, column: "e").first
    coord2 = BoardSquare.where(row: 8, column: "e").first

    GamePiece.create(name: "black-king", board_square: coord1, :avatar => File.new("#{Rails.root}/app/assets/images/black-king.png"))
    GamePiece.create(name: "white-king", board_square: coord2, :avatar => File.new("#{Rails.root}/app/assets/images/white-king.png"))
  end


end