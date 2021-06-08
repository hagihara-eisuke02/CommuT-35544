class RoomsController < ApplicationController
  
  
  def index
    @rooms = Room.order(id: :DESC)
  end

  def new
    @room = Room.new
  end



  private

  def set_item
    @post = Post.find(params[:post_id])
  end

end
