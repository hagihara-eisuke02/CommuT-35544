class UsersController < ApplicationController
  before_action :set_user, only: [:new, :index, :new, :edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to root_path
    end
  end
  
  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
