class BoardSquare < ActiveRecord::Base
	belongs_to :board 
	has_one :game_piece
end
