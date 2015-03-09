class GamePiece < ActiveRecord::Base
	belongs_to :player
	belongs_to :board_square
end
