class AddReferencesToGamePiece < ActiveRecord::Migration
  def change
     add_reference :game_pieces, :board_square, index: true
  end

end
