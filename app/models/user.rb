class User < ActiveRecord::Base 
  attr_reader :games

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  has_many :games

  # @games = []

  # def self.games
  #   @games = Game.find_by(:user_id => self.id)

  #   @games.each do |g|
  #     g.title
  #   end
  # end

  # def self.save_game(game)
  #   @games << game
  # end
end