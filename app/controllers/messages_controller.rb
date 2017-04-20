class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversation_path(@message.conversation)
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :conversation_id, :message)
  end
end
