class MessagesController < ApplicationController
  before_action :set_post, only: [:index, :new, :create, :edit, :show]

  def index
    @messages = Message.all
    @message = Message.new
    @messages = @post.message.includes(:user)
  end
  
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @user = current_user 
    if @message.save
      ActionCable.server.broadcast "message_channel", content: @message, user: @user
    else
      render :index
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
