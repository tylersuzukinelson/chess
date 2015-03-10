class RemovePlayersToBoards < ActiveRecord::Migration
  def change
    remove_column :boards, :player1
    remove_column :boards, :player2
  end
end
