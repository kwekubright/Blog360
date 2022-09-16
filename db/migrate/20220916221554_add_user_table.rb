class AddUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      add_index :users, :UserId, unique: true
      
      t.integer :UserId
      t.string :Name
      t.string :Photo
      t.string :Bio
      t.string :PostsCounter

      t.timestamps
    end
  end
end
