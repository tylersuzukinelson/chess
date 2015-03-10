class AddFirstMoveToGamePiece < ActiveRecord::Migration
  def change
  	add_column :game_pieces, :moved, :boolean, default: false
  end
end
