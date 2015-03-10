class AddUserToGamePiece < ActiveRecord::Migration
  def change
    add_reference :game_pieces, :user, index: true
    add_foreign_key :game_pieces, :users
  end
end
