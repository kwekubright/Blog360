require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  describe 'Comment' do
    context 'associations' do
      it { should belong_to(:author).class_name('User') }
      it { should belong_to(:post) }
    end

    context 'validations' do
      it { should validate_presence_of(:text) }
      it { should validate_presence_of(:author_id) }
      it { should validate_presence_of(:post_id) }
    end

    context 'methods' do
      it 'should update post comments counter' do
        comment = Comment.new
        expect(comment.update_counter(1, true)).to eq(1)
      end
    end
  end
end
