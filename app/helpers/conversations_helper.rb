module ConversationsHelper
  def receivers(conversation)
    receivers = ""
    conversation.participants.each do |participant|
      receivers << (participant.user.email + ", ") if participant.user != current_user
    end
    return receivers[0..-3]
  end
end
