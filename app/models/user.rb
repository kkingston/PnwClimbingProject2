class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_routes, through: :reviews, source: :route
  has_many :routes
  
  has_secure_password #validates presence of password
  
  validates :username, uniqueness: true, presence: true

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(10)
    end
  end
end
