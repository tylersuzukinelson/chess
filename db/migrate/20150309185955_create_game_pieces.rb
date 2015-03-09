class CreateGamePieces < ActiveRecord::Migration
  def change
    create_table :game_pieces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
