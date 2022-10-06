require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Tom',
                          photo: 'https://thumbs.dreamstime.com/b/human-standing-cave
                          -heart-worship-god-concept-silhouette-against-blurred-city-
                          sunrise-background-207996091.jpg', posts_counter: 0)
      # create 3 post
      3.times do
        @post = Post.create(
          author: @user,
          title: 'Post title',
          text: 'Post text',
          comments_counter: 0,
          likes_counter: 0
        )
        # create 3 comments for each post
        3.times do
          Comment.create(author: @user, post: @post, text: 'This is great')
        end
      end

      visit user_path(@user)
    end

    it 'I can see the user\'s profile picture.' do
      expect(page).to have_selector('img')
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content('Bio')
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content('Post title')
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content('All Posts')
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Post title')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      visit user_path(@user)
      expect(page).to have_content('All Posts')
    end
  end
end
