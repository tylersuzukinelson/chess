class GamePiece < ActiveRecord::Base
	belongs_to :player
	belongs_to :square
end
