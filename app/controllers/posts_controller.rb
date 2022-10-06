class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:author, :comments).find(params[:id])
    @user = User.includes(:posts).find(params[:user_id])
    @comments = @post.comments
  end

  def new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to "/user/#{@post.author.id}/posts/#{@post.id}", notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
