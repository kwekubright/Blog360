require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Tom',
                          photo: 'https://thumbs.dreamstime.com/b/human-standing-cave-heart
                          -worship-god-concept-silhouette-against-blurred-city-
                          sunrise-background-207996091.jpg', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Post title', text: 'Post text', comments_counter: 0,
                          likes_counter: 0)
      5.times do |i|
        Comment.create(author: @user, post: @post, text: "This is great #{i}")
      end
      visit user_post_path(@user, @post)
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content('Post title')
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content('Tom')
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 5')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post body.' do
      expect(page).to have_content('Post text')
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('This is great 0')
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Post title')
    end
  end
end
