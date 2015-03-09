class AddPlayersToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :player1, index: true
    add_foreign_key :boards, :users
    add_reference :boards, :player2, index: true
    add_foreign_key :boards, :users
  end
end
