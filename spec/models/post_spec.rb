require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(
      author_id: 1,
      text: 'Example content',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'Validations' do
    it 'checks if title exceedds 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'if comments counter is not an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'if likes counter is not an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end
  end

  describe 'Methods' do
    it 'returns the recent five comments' do
      expect(Post.recent_five_comments(1)).to eq([])
    end
  end
end
