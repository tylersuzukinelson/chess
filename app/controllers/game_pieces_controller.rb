class GamePiecesController < ApplicationController

  def get_move_set
    game_piece = GamePiece.find params[:id]
    if game_piece.name == "knight"
      get_knight_moves(game_piece.row, game_piece.column)
    end
  end

  private

  def is_valid_position(row, column)
    valid_rows = [1,2,3,4,5,6,7,8]
    valid_columns = ['a','b','c','d','e','f','g','h']
    valid_rows.include? row && valid_columns.include? column
  end

  def get_knight_moves(row, column)
    get_knight_up_moves(row, column) + 
    get_knight_down_moves(row, column) + 
    get_knight_left_moves(row, column) + 
    get_knight_right_moves(row, column)
  end

  def get_knight_up_moves(row, column)
    get_knight_up_left_moves(row, column) +
    get_knight_up_right_moves(row, column)
  end

  def get_knight_up_left_moves(row, column)
    new_row = row + 2
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_up_right_moves(row, column)
    new_row = row + 2
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_down_moves(row, column)
    get_knight_down_left_moves(row, column) +
    get_knight_down_right_moves(row, column)
  end

  def get_knight_down_left_moves(row, column)
    new_row = row - 2
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_down_right_moves(row, column)
    new_row = row - 2
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_left_moves(row, column)
    get_knight_left_up_moves(row, column) +
    get_knight_left_down_moves(row, column)
  end

  def get_knight_left_up_moves(row, column)
    new_row = row - 1
    new_column = (column.ord - 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_left_down_moves(row, column)
    new_row = row + 1
    new_column = (column.ord - 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_right_moves(row, column)
    get_knight_right_up_moves(row, column) +
    get_knight_right_down_moves(row, column)
  end

  def get_knight_right_up_moves(row, column)
    new_row = row - 1
    new_column = (column.ord + 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_knight_right_down_moves(row, column)
    new_row = row + 1
    new_column = (column.ord + 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

end
