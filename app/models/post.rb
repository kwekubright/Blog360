class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # A method that updates the posts counter for a user.
  #
  # @param author_id [Integer] The id of the user.
  # @param increment [Boolean] Whether to increment or decrement the counter.
  #
  # @return [Integer] The new value of the counter.
  #
  def self.update_counter(author_id, increment)
    user = User.find(author_id)
    if increment
      user.posts_count += 1
    else
      user.posts_count -= 1
    end
    user.save
    user.posts_count
  end

  def self.recent_five_comments(post_id)
    comments.where(post_id: post_id).order(created_at: :desc).limit(5).all
  end
end
