class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_counter(post_id, increment)
    post = Post.find(post_id)
    if increment
      post.likes_count += 1
    else
      post.likes_count -= 1
    end
    post.save
    post.likes_count
  end
end
