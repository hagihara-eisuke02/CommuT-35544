class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  # before_action :set_post, only: [:index, :create]
  # before_action :cheak_user, only: [:new, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @posts_tag = PostsTag.new
  end

  def create
    @posts_tag = PostsTag.new(post_params)
    if @posts_tag.valid?
      @posts_tag.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  private

  # def cheak_user
  #   if current_user.id == @item.user.id || @item.record.present?
  #     redirect_to root_path
  #   end
  # end
  
  def post_params
    params.require(:posts_tag).permit(:title, :tag_name, :message).merge(user_id: current_user.id)
  end

end

