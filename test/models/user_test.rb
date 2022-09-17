require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe 'User' do
    context 'associations' do
      it { should have_many(:posts).with_foreign_key('author_id') }
      it { should have_many(:comments).with_foreign_key('author_id') }
      it { should have_many(:likes).with_foreign_key('author_id') }
    end

    context 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
    end

    context 'methods' do
      it 'should return 3 recent posts' do
        user = User.new
        expect(user.three_recent_posts(1)).to eq(Post.where(author_id: 1).order(created_at: :desc).limit(3).all)
      end
    end
  end
end
