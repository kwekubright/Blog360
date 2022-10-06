require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom',
                        photo: 'https://thumbs.dreamstime.com/b/
                        human-standing-cave-heart-worship-god-concept-silhouette-against-blurred-city-
                        sunrise-background-207996091.jpg', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Post title', text: 'Post text', comments_counter: 0, likes_counter: 0)
    5.times do |i|
      Comment.create(author: @user, post: @post, text: "This is great #{i}")
    end
    visit user_post_path(@user, @post)
  end

  it 'I can see the user\'s profile picture.' do
    expect(page).to have_selector('img')
  end

  it 'I can see the user\'s username.' do
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Total posts')
  end

  it 'I can see a post\'s title.' do
    expect(page).to have_content('Post title')
  end

  it 'I can see some of the post\'s body.' do
    expect(page).to have_content('Post text')
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content('This is great 0')
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments: 5')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes: 0')
  end

  it 'When I click on a post, it redirects me to that post\'s show page.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Post title')
  end
end
