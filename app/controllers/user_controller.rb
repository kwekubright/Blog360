class UserController < ApplicationController
  def index
    @all_users = User.includes(:posts).all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @recent_three_posts = @user.three_recent_posts(@user.id)
  end
end
