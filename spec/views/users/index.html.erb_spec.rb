require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Tom',
                          photo: 'https://thumbs.dreamstime.com/b/human-standing
                          -cave-heart-worship-god-concept-silhouette-against-blurred
                          -city-sunrise-background-207996091.jpg', posts_counter: 0)
      @post = Post.create(
        id: 1,
        title: 'Post title',
        text: 'Post text',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(author: @user, post: @post, text: 'This is great')
      Comment.create(author: @user, post: @post, text: 'Testing')
      Comment.create(author: @user, post: @post, text: 'I love this test')

      visit user_path(@user)
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_css("img[src*='https://thumbs.dreamstime.com/b/human-standing-cave-heart
        -worship-god-concept-silhouette-against-blurred-city-sun
        rise-background-207996091.jpg']")
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      visit user_path(@user)
      expect(page).to have_content('Bio')
    end
  end
end
