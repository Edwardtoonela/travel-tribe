class ChatroomsController < ApplicationController
  def show
    authorize current_user
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
