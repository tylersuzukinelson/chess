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
      @possible_moves = get_bishop_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "rook"
      @possible_moves = get_rook_moves(game_piece.row, game_piece.column)
    elsif game_piece.name.downcase == "queen"
      @possible_moves = get_queen_moves(game_piece.row, game_piece.column)
    end
  end

  def move
    @game_piece = GamePiece.find params[:game_piece_id]
    board_square = BoardSquare.where("row = ? AND column = ?", params[:row], params[:column])
    if board_square.game_piece.exists?
      board_square.game_piece.destroy
    end
    @game_piece.update(board_square_id: board_square.id)
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
    ].reject! { |set| set.empty? }.flatten(1)
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
      [
        get_king_up_moves(row, column), 
        get_king_down_moves(row, column), 
        get_king_left_moves(row, column), 
        get_king_right_moves(row, column)
      ].compact,
      get_king_diagonal_moves(row, column)
    ].compact.flatten(1)
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
  def get_bishop_moves(row, column)
    [
      get_bishop_diagonal_right_moves(row, column).flatten(1),
      get_bishop_diagonal_left_moves(row, column).flatten(1)
    ].flatten(1)
  end

  def get_bishop_diagonal_right_moves(row, column)
    [
      get_bishop_ne_moves(row, column),
      get_bishop_se_moves(row, column)
    ].compact
  end 

  def get_bishop_diagonal_left_moves(row, column)
    [
      get_bishop_nw_moves(row, column),
      get_bishop_sw_moves(row, column)
    ].compact
  end 

  #bishop NE moves
  def get_bishop_ne_moves(row, column)
    output = []
    while row >= 1 && column.ord <= 104
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord + 1).chr
        row -= 1
      end
    end  

    output.compact
  end

  #bishop SE moves
  def get_bishop_se_moves(row, column)
    output = []
    while row <= 8 && column.ord <= 104
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord + 1).chr
        row += 1
      end
    end  

    output.compact
  end

  #bishop NW moves
  def get_bishop_nw_moves(row, column)
    output = []
    while row >= 1 && column.ord >= 97
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord - 1).chr
        row -= 1
      end
    end  

    output.compact
  end
 
  #bishop SW moves
  def get_bishop_sw_moves(row, column)
    output = []
    while row <= 8 && column.ord >= 97
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord - 1).chr
        row += 1
      end
    end  

    output.compact
  end

  #rook moves
  def get_rook_moves(row, column)
    tmp = [
      get_rook_horizontal_moves(row, column).flatten(1),
      get_rook_vertical_moves(row, column).flatten(1)
    ].flatten(1)
  end

  def get_rook_horizontal_moves(row, column)
    [
      get_rook_right_moves(row, column),
      get_rook_left_moves(row, column)
    ]
  end

  def get_rook_vertical_moves(row, column)
    [
      get_rook_up_moves(row, column), 
      get_rook_down_moves(row, column)
    ]
  end

  # rook horizontal moves
  def get_rook_right_moves(row, column)
    output = []
    while column.ord <= 104
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord + 1).chr
      end
    end  

    output.compact
  end

  def get_rook_left_moves(row, column)
    output = []
    while column.ord >= 97
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        column = (column.ord - 1).chr
      end
    end  
    output.compact    
  end

  # rook vertical moves
  def get_rook_up_moves(row, column)
   output = []
    while row >= 1
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        row -= 1 
      end
    end  
    output.compact      
  end

  def get_rook_down_moves(row, column)
   output = []
    while row <= 8
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        row += 1 
      end
    end  
    output.compact  
  end

  #Queen moves
  def get_queen_moves(row, column)
    tmp = [
      get_queen_horizontal_moves(row, column).flatten(1),
      get_queen_vertical_moves(row, column).flatten(1),
      get_queen_diagonal_right_moves(row, column).flatten(1),
      get_queen_diagonal_left_moves(row, column).flatten(1)
    ].flatten(1)
  end

  def get_queen_horizontal_moves(row, column)
    [
      get_queen_right_moves(row, column),
      get_queen_left_moves(row, column)
    ]
  end

  def get_queen_vertical_moves(row, column)
    [
      get_queen_up_moves(row, column), 
      get_queen_down_moves(row, column)
    ]
  end

  # queen horizontal moves
  def get_queen_right_moves(row, column)
    output = []
    while column.ord <= 104
      column = (column.ord + 1).chr

      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
      end
    end  
    output.compact
  end

  def get_queen_left_moves(row, column)
    output = []
    while column.ord >= 97
      column = (column.ord - 1).chr
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
      end
    end  
    output.compact    
  end

  # queen vertical moves
  def get_queen_up_moves(row, column)
    output = []
    while row >= 1
      row -= 1 
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
        # row -= 1 
      end
    end  
    output.compact      
  end

  def get_queen_down_moves(row, column)
    output = []
    while row <= 8
      row += 1 
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
      end
    end  
    output.compact  
  end

  #queen diagonal moves
  def get_queen_diagonal_right_moves(row, column)
    [
      get_queen_ne_moves(row, column),
      get_queen_se_moves(row, column)
    ].compact
  end 

  def get_queen_diagonal_left_moves(row, column)
    [
      get_queen_nw_moves(row, column),
      get_queen_sw_moves(row, column)
    ].compact
  end 

  #queen NE moves
  def get_queen_ne_moves(row, column)
    output = []
    while row >= 1 && column.ord <= 104
      column = (column.ord + 1).chr
      row -= 1      
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)      
      end
    end  
    output.compact
  end

  #queen SE moves
  def get_queen_se_moves(row, column)
    output = []
    while row <= 8 && column.ord <= 104
      column = (column.ord + 1).chr
      row += 1 
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)         
      end
    end  
    output.compact
  end

  #queen NW moves
  def get_queen_nw_moves(row, column)
    output = []
    while row >= 1 && column.ord >= 97
      column = (column.ord - 1).chr
      row -= 1
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)         
      end
    end  
    output.compact
  end
 
  #queen SW moves
  def get_queen_sw_moves(row, column)
    output = []
    while row <= 8 && column.ord >= 97
      column = (column.ord - 1).chr
      row += 1
      board_square = BoardSquare.where("row = ?", row).find_by_column column

      if board_square && board_square.game_piece
        if board_square.game_piece.user != current_user
          # encountered opponent's game piece - add space to possible move
          output << [row, column] if is_valid_position(row, column)      
        end
        break
      else
        output << [row, column] if is_valid_position(row, column)         
      end
    end  
    output.compact
  end

end
