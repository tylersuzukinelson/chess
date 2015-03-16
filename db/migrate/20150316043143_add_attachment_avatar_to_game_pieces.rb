class AddAttachmentAvatarToGamePieces < ActiveRecord::Migration
  def self.up
    change_table :game_pieces do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :game_pieces, :avatar
  end
end
