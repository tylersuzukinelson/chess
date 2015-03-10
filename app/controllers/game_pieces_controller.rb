class GamePiecesController < ApplicationController

  def get_move_set
    game_piece = GamePiece.find params[:game_piece_id]
    @possible_moves = [];
    if game_piece.name == "knight"
      @possible_moves = get_knight_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "pawn"
      if !game_piece.moved
        #pawn's first move
        @possible_moves = get_pawn_initial_moves(game_piece.row, game_piece.column)
      else
        #pawn has already moved before
        game_piece.moved == true
        @possible_moves = get_pawn_moves(game_piece.row, game_piece.column)
      end
    elsif game_piece.name == "king"
      @possible_moves = get_king_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "bishop"
      
    end
  end

  private

  def is_valid_position(row, column)
    valid_rows = [1,2,3,4,5,6,7,8]
    valid_columns = ['a','b','c','d','e','f','g','h']
    valid_rows.include?(row) && valid_columns.include?(column)
  end

  #knight moves
  def get_knight_moves(row, column)
    [
      get_knight_up_moves(row, column), 
      get_knight_down_moves(row, column),  
      get_knight_left_moves(row, column),
      get_knight_right_moves(row, column)
    ].compact
  end

  def get_knight_up_moves(row, column)
    [
      get_knight_up_left_moves(row, column), 
      get_knight_up_right_moves(row, column)
    ].compact
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
    [
      get_knight_down_left_moves(row, column),
      get_knight_down_right_moves(row, column)
    ].compact
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
    [
      get_knight_left_up_moves(row, column), 
      get_knight_left_down_moves(row, column)
    ].compact
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
    [
      get_knight_right_up_moves(row, column), 
      get_knight_right_down_moves(row, column)
    ].compact
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

  # pawn moves
  def get_pawn_initial_moves(row, column)
    #move pawn forward by one or two board_squares
    get_pawn_up_moves(row, column) 
  end

  def get_pawn_up_moves(row, column)
    [
      get_pawn_up_one(row, column), 
      get_pawn_up_two(row, column)
    ].compact
  end

  def get_pawn_diagonal_moves(row, column)
    [
      get_pawn_diagonal_right(row, column), 
      get_pawn_diagonal_left(row, column)
    ].compact
  end

  def get_pawn_up_one(row, column)
    new_row = row - 1
    new_column = column
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_pawn_up_two(row, column)
    new_row = row - 2
    new_column = column
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_pawn_diagonal_right(row, column)
    new_row = row - 1
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_pawn_diagonal_left(row, column)
    new_row = row - 1
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  #king moves
  def get_king_moves(row, column)
    [
      get_king_up_moves(row, column), 
      get_king_down_moves(row, column), 
      get_king_left_moves(row, column), 
      get_king_right_moves(row, column), 
      get_king_diagonal_moves(row, column)
    ].compact
  end

  def get_king_up_moves(row, column)
    new_row = row - 1
    new_column = column
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_down_moves(row, column)
    new_row = row + 1
    new_column = column
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_left_moves(row, column)
    new_row = row
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_right_moves(row, column)
    new_row = row
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_diagonal_moves(row, column)
    [
      get_king_nw_moves(row, column), 
      get_king_ne_moves(row, column), 
      get_king_sw_moves(row, column),
      get_king_se_moves(row, column)
    ].compact
  end

  def get_king_nw_moves(row, column)
    new_row = row - 1
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_ne_moves(row, column)
    new_row = row - 1
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_sw_moves(row, column)
    new_row = row + 1
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  def get_king_se_moves(row, column)
    new_row = row + 1
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)
  end

  #bishop moves
  def get_bishop_diagonal_right_moves(row, column)
    get_bishop_ne_moves(row, column) +
    get_bishop_se_moves(row, column)
  end 

  def get_bishop_diagonal_left_moves(row, column)
    get_bishop_nw_moves(row, column) +
    get_bishop_sw_moves(row, column)
  end 

  #bishop NE moves
  def get_bishop_ne_moves(row, column)
    while row >= 1
      while column <= 8
        new_row = row
        new_column = (column.ord).chr
        [new_row, new_column] if is_valid_position(new_row, new_column)      
        column += 1
        row -= 1
      end
    end  
  end

  #bishop SE moves
  def get_bishop_se_moves(row, column)
    while row <= 8
      while column <= 8
        new_row = row
        new_column = (column.ord).chr
        [new_row, new_column] if is_valid_position(new_row, new_column)      
        column += 1
        row += 1
      end
    end  
  end

  #bishop NW moves
  def get_bishop_nw_moves(row, column)
    while row >= 1
      while column >= 1
        new_row = row
        new_column = (column.ord).chr
        [new_row, new_column] if is_valid_position(new_row, new_column)      
        column -= 1
        row -= 1
      end
    end  
  end
 
  #bishop SW moves
  def get_bishop_sw_moves(row, column)
    while row <= 8
      while column >= 1
        new_row = row
        new_column = (column.ord).chr
        [new_row, new_column] if is_valid_position(new_row, new_column)      
        column -= 1
        row += 1
      end
    end  
  end
end
