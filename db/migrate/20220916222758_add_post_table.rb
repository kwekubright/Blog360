class AddPostTable < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      add_index :posts, :PostId, unique: true
      add_foreign_key :posts, :users, column: :AuthorID, primary_key: :UserId
      
      t.integer :PostId
      t.integer :AuthorId
      t.string  :Title
      t.string  :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
