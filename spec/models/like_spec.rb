require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    described_class.new(
      author_id: 1,
      post_id: 1
    )
  end

  describe 'Validations' do
    it 'checks if author_id is not an integer' do
      subject.author_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'checks if post_id is not an integer' do
      subject.post_id = 'a'
      expect(subject).to_not be_valid
    end
  end
end
