require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  describe 'Like' do
    context 'associations' do
      it { should belong_to(:author).class_name('User') }
      it { should belong_to(:post) }
    end

    context 'validations' do
      it { should validate_presence_of(:author_id) }
      it { should validate_presence_of(:post_id) }
    end

    context 'methods' do
      it 'should update post likes counter' do
        like = Like.new
        expect(like.update_counter(1, true)).to eq(1)
      end
    end
  end
end
