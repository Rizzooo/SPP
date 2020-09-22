class User < ActiveRecord::Base 
  # attr_accessor :username

  validates :username, :presence => true, :uniqueness => true
  has_secure_password
  
  has_many :games
end