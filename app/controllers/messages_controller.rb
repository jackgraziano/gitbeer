class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:message][:conversation_id])

    if @message.save
      respond_to do |format|
        format.html { redirect_to conversation_path(@message.conversation)}
        format.js
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :conversation_id, :message)
  end
end
