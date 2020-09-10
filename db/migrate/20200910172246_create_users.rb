class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      # t.string :password
      # t.integer :age # May need to change to birthdate.
    end
  end
end
