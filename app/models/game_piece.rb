class GamePiece < ActiveRecord::Base
	belongs_to :user
	belongs_to :board_square
end
