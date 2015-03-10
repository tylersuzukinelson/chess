class GamePiecesController < ApplicationController

  def get_move_set
    game_piece = GamePiece.find params[:id]
    if game_piece.name == "knight"
      get_knight_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "pawn"
      if !game_piece.moved
        #pawn's first move
        get_pawn_initial_moves(game_piece.row, game_piece.column)
      else
        #pawn has already moved before
        get_pawn_moves(game_piece.row, game_piece.column)
    elsif game_piece.name == "king"
      get_king_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "bishop"
      
    end
  end

  private

  def is_valid_position(row, column)
    valid_rows = [1,2,3,4,5,6,7,8]
    valid_columns = ['a','b','c','d','e','f','g','h']
    valid_rows.include? row && valid_columns.include? column
  end

  #knight moves
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

  # pawn moves
  def get_pawn_initial_moves(row, column)
    #move pawn forward by one or two board_squares
    get_pawn_up_moves(row, column) 
  end

  def get_pawn_up_moves(row, column)
    get_pawn_up_one(row, column) +
    get_pawn_up_two(row, column) 
  end

  def get_pawn_diagonal_moves(row, column)
    get_pawn_diagonal_right(row, column) +
    get_pawn_diagonal_left(row, column) 
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
    get_king_up_moves(row, column) + 
    get_king_down_moves(row, column) + 
    get_king_left_moves(row, column) + 
    get_king_right_moves(row, column) + 
    get_king_diagonal_moves(row, column)
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
    get_king_nw_moves(row, column) + 
    get_king_ne_moves(row, column) + 
    get_king_sw_moves(row, column) +
    get_king_se_moves(row, column)
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

  def get_bishop_diagonal_right_moves(row, column)
    get_bishop_nw_moves(row, column) +
    get_bishop_sw_moves(row, column)
  end 

  def get_bishop_ne_moves(row, column)
    get_bishop_ne_one(row, column) +
    get_bishop_ne_two(row, column) +
    get_bishop_ne_three(row, column) +
    get_bishop_ne_four(row, column) +
    get_bishop_ne_five(row, column) + 
    get_bishop_ne_six(row, column) + 
    get_bishop_ne_seven(row, column) 
  end

  def get_bishop_se_moves(row, column)
    get_bishop_se_one(row, column) +
    get_bishop_se_two(row, column) +
    get_bishop_se_three(row, column) +
    get_bishop_se_four(row, column) +
    get_bishop_se_five(row, column) + 
    get_bishop_se_six(row, column) + 
    get_bishop_se_seven(row, column) 
  end

  def get_bishop_nw_moves(row, column)
    get_bishop_nw_one(row, column) +
    get_bishop_nw_two(row, column) +
    get_bishop_nw_three(row, column) +
    get_bishop_nw_four(row, column) +
    get_bishop_nw_five(row, column) + 
    get_bishop_nw_six(row, column) + 
    get_bishop_nw_seven(row, column) 
  end

  def get_bishop_sw_moves(row,column)
    get_bishop_sw_one(row, column) +
    get_bishop_sw_two(row, column) +
    get_bishop_sw_three(row, column) +
    get_bishop_sw_four(row, column) +
    get_bishop_sw_five(row, column) + 
    get_bishop_sw_six(row, column) + 
    get_bishop_sw_seven(row, column) 
  end

  #bishop NE moves
  def get_bishop_ne_one(row, column)
    new_row = row - 1
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_ne_two(row, column)
    new_row = row - 2
    new_column = (column.ord + 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_ne_three(row, column)
    new_row = row - 3
    new_column = (column.ord + 3).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)      
  end

  def get_bishop_ne_four(row, column)
    new_row = row - 4
    new_column = (column.ord + 4).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_ne_five(row, column)
    new_row = row - 5
    new_column = (column.ord + 5).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_ne_six(row, column)
    new_row = row - 6
    new_column = (column.ord + 6).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_ne_seven(row, column)
    new_row = row - 7
    new_column = (column.ord + 7).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  #bishop SE moves
  def get_bishop_se_one(row, column)
    new_row = row + 1
    new_column = (column.ord + 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_se_two(row, column)
    new_row = row + 2
    new_column = (column.ord + 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_se_three(row, column)
    new_row = row + 3
    new_column = (column.ord + 3).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)      
  end

  def get_bishop_se_four(row, column)
    new_row = row + 4
    new_column = (column.ord + 4).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_se_five(row, column)
    new_row = row + 5
    new_column = (column.ord + 5).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_se_six(row, column)
    new_row = row + 6
    new_column = (column.ord + 6).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_se_seven(row, column)
    new_row = row + 7
    new_column = (column.ord + 7).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  #bishop NW moves
  def get_bishop_nw_one(row, column)
    new_row = row - 1
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_nw_two(row, column)
    new_row = row - 2
    new_column = (column.ord - 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_nw_three(row, column)
    new_row = row - 3
    new_column = (column.ord - 3).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)      
  end

  def get_bishop_nw_four(row, column)
    new_row = row - 4
    new_column = (column.ord - 4).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_nw_five(row, column)
    new_row = row - 5
    new_column = (column.ord - 5).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_nw_six(row, column)
    new_row = row - 6
    new_column = (column.ord - 6).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_nw_seven(row, column)
    new_row = row - 7
    new_column = (column.ord - 7).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  #bishop SW moves
  def get_bishop_sw_one(row, column)
    new_row = row + 1
    new_column = (column.ord - 1).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_sw_two(row, column)
    new_row = row + 2
    new_column = (column.ord - 2).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_sw_three(row, column)
    new_row = row + 3
    new_column = (column.ord - 3).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)      
  end

  def get_bishop_sw_four(row, column)
    new_row = row + 4
    new_column = (column.ord - 4).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_sw_five(row, column)
    new_row = row + 5
    new_column = (column.ord - 5).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_sw_six(row, column)
    new_row = row + 6
    new_column = (column.ord - 6).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end

  def get_bishop_sw_seven(row, column)
    new_row = row + 7
    new_column = (column.ord - 7).chr
    [new_row, new_column] if is_valid_position(new_row, new_column)    
  end
end
