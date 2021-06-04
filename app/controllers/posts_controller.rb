class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @posts = Post.order(id: :DESC)
    @tags = Tag.order(id: :DESC)
  end

  def new
    @posts_tag = PostsTag.new
  end

  def create
    @posts_tag = PostsTag.new(post_params)
    tag_list = params[:posts_tag][:tag_name].split(",")
    if @posts_tag.valid?
      @posts_tag.save(tag_list)
      redirect_to root_path
    else
      render 'index'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end
  
  private

  def post_params
    params.require(:posts_tag).permit(:title, :tag_name, :message).merge(user_id: current_user.id)
  end

end
