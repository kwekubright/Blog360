require 'test_helper'

class PostTest < ActiveSupport::TestCase
  describe 'Post' do
    context 'associations' do
      it { should belong_to(:author).class_name('User') }
      it { should have_many(:comments) }
      it { should have_many(:likes) }
    end

    context 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:text) }
      it { should validate_presence_of(:author_id) }
      it { should validate_numericality_of(:likes_count).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:comments_count).only_integer.is_greater_than_or_equal_to(0) }
    end

    context 'methods' do
      it 'should return 3 recent posts' do
        post = Post.new
        expect(post.three_recent_posts(1)).to eq(Post.where(author_id: 1).order(created_at: :desc).limit(3).all)
      end
    end
  end
end
