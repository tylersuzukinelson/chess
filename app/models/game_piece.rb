class GamePiece < ActiveRecord::Base
	belongs_to :user
	belongs_to :board_square

  def row
    board_square.row
  end

  def column
    board_square.column
  end

  	def get_game_piece_image()
		if self.name == "pawn"
			#return link to pawn image
			return "white-pawn.png"
		elsif self.name == "bishop"
			return "white-bishop.png"
		elsif self.name == "rook"
			return "white-rook.png"
		elsif self.name == "knight"
			return "white-knight.png"
		elsif self.name == "queen"
			return "white-queen.png"
		elsif self.name == "king"
			return "white-king.png"				
		end
	end

end
