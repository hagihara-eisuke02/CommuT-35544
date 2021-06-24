class UsersController < ApplicationController
  before_action :set_user, only: [:new, :index, :new, :edit, :show]

  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
  end
  
  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
