class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  #A method that updates the comments counter for a post.
  # 
  # @param post_id [Integer] The id of the post.
  # @param increment [Boolean] Whether to increment or decrement the counter.
  # 
  # @return [Integer] The new value of the counter.
  # 
  def self.update_counter(post_id, increment)
    post = Post.find(post_id)
    if increment
      post.comments_count += 1
    else
      post.comments_count -= 1
    end
    post.save
    post.comments_count
  end
end
