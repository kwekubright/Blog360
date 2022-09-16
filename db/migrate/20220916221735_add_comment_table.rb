class AddCommentTable < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      add_foreign_key :comments, :users, column: :AuthorID, primary_key: :UserId
      add_foreign_key :comments, :posts, column: :PostID, primary_key: :PostId

      t.integer :AuthorID
      t.integer :PostID
      t.string  :Text
      
      t.timestamps
    end
  end
end
