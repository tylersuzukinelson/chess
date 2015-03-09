class GamePiece < ActiveRecord::Base
	belongs_to :user
	belongs_to :board_square

  def row
    board_square.row
  end

  def column
    board_square.column
  end

end
