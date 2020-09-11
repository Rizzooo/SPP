class User < ActiveRecord::Base 
  attr_reader :username, :games
  
  has_secure_password
  has_many :games

  # def initialize
  #   @games = []
  # end

  # def games 
  #   @games
  # end

  # def save(game) 
  #   @games << game
  # end
end