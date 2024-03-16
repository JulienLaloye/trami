class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @chatroom = Chatroom.find_by(room: @room)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to room_path(@room)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
