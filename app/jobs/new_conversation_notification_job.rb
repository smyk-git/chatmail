class NewConversationNotificationJob < ApplicationJob
  queue_as :default

  def perform(conversation_id, user_id)
    conversation = Conversation.find(conversation_id)
    user = User.find(user_id)

    UserMailer.new_conversation_notification(conversation, user).deliver_now

  end
end
