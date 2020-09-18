class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :rating
      t.integer :release_year
      t.integer :user_id
    end
  end
end
