class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
    Comment.where(post_id: post_id).order(created_at: :desc).limit(5).all
  end
end
