class Board < ActiveRecord::Base
  has_many :squares, dependent: :nullify
  has_one :user, as: :player1
  has_one :user, as: :player2
end
