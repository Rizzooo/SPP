class User < ActiveRecord::Base 
  # validates :username, :presence => true, :uniqueness => true
  has_secure_password

  has_many :games, through: :user_games
  has_many :usergames
end