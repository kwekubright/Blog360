class UserController < ApplicationController
  def index
    @allUsers = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
