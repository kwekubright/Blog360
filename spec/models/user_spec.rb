require 'rails_helper'

RSpec.describe User, type: :model do
  subject do 
    described_class.new(
      name: "Example User",
      photo: "https://www.example.com/photo.jpg",
      bio: "Example bio",
      posts_counter: 0
    )
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a posts_counter" do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a posts_counter less than 0" do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many posts" do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end

    it "has many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it "has many likes" do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end
end