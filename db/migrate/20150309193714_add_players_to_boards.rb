class AddPlayersToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :player1, :integer
    add_column :boards, :player2, :integer
    add_reference :boards, :player1, index: true
    add_foreign_key :boards, :users, column: :player1
    add_reference :boards, :player2, index: true
    add_foreign_key :boards, :users, column: :player2
  end
end
