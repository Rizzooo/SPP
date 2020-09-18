class Game < ActiveRecord::Base 
  # attr_reader :user_id
  belongs_to :user
end