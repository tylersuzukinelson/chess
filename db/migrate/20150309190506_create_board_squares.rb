class CreateBoardSquares < ActiveRecord::Migration
  def change
    create_table :board_squares do |t|
      t.integer :row
      t.string :column

      t.timestamps null: false
    end
  end
end
