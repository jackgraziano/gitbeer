class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def new
    facility_owner = Facility.find(params[:facility_id]).user
    if current_user.conversations.merge(facility_owner.conversations).count > 0
      @conversation = current_user.conversations.merge(facility_owner.conversations).first
    else
      @conversation = Conversation.create
      Participant.create(conversation: @conversation, user: current_user)
      Participant.create(conversation: @conversation, user: facility_owner)
    end
    redirect_to conversation_path(@conversation)
  end
end
