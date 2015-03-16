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

end
