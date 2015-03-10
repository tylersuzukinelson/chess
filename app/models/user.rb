class User < ActiveRecord::Base

  has_secure_password

  belongs_to :board

  has_many :game_pieces, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end

end
