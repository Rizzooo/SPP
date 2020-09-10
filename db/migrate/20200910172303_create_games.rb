class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title 
      t.string :genre
      t.string :rating
      t.year :release_year
    end
  end
end
