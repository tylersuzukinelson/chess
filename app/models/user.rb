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

  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider   = auth.provider 
      user.uid        = auth.uid
      user.name       = auth.info.name
      user.image      = auth.info.image
      user.token      = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save(:validate => false)
    end
  end

end
