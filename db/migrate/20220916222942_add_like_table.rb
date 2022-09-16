class AddLikeTable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      add_foreign_key :likes, :users, column: :AuthorID, primary_key: :UserId
      add_foreign_key :likes, :posts, column: :PostID, primary_key: :PostId
      
      t.integer :AuthorID
      t.integer :PostID

      t.timestamps
    end
  end
end
