class MessagesController < ApplicationController
  before_action :set_post, only: [:index, :new, :create, :edit, :show]

  def index
    @messages = Message.all
    @message = Message.new
    # @messages = Message.order(id: "DESC")
    # @message = Message.find(params[:message_id])
  end
  
  def new
    @messages = Message.all
    @message = Message.new
    # @messages = @post.message.includes(:user)
    # @message = @post.message.build
  end

  def create
    @message = Message.new(text: params[:message][:text])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      render :new
    end
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # def message_params
  #   params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  # end

end
