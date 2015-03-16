require "open-uri"

class GamePiece < ActiveRecord::Base
	belongs_to :user
	belongs_to :board_square

	has_attached_file :avatar, default_url: "black-pawn.png",
	  :url => "/assets/game_pieces/:id/:basename.:extension",  
  	  :path => ":rails_root/public/assets/game_pieces/:id/:basename.:extension" 
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def row
    board_square.row
  end

  def column
    board_square.column
  end


  	def get_game_piece_image()
		if self.name == "white-pawn"
			#return link to pawn image
			return "white-pawn.png"
		elsif self.name == "white-bishop"
			return "white-bishop.png"
		elsif self.name == "white-rook"
			return "white-rook.png"
		elsif self.name == "white-knight"
			return "white-knight.png"
		elsif self.name == "white-queen"
			return "white-queen.png"
		elsif self.name == "white-king"
			return "white-king.png"	
		elsif self.name == "black-pawn"
			return "black-pawn.png"
		elsif self.name == "black-bishop"
			return "black-bishop.png"
		elsif self.name == "black-rook"
			return "black-rook.png"
		elsif self.name == "black-knight"
			return "black-knight.png"
		elsif self.name == "black-queen"
			return "black-queen.png"
		elsif self.name == "black-king"
			return "black-king.png"	

										
		end
	end

end
