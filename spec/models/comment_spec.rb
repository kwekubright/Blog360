require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do 
    described_class.new(
      author_id: 1,
      post_id: 1,
      text: "Example content"
    )
  end

  describe "Validations" do
    it 'checks if text exceedds 250 characters' do
      subject.text = 'a' * 251 
      expect(subject).to_not be_valid 
    end
  end
end