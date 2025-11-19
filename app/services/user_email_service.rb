class UserEmailService
  attr_reader :conversation

  def initialize(conversation)
    @conversation = conversation
  end

  def send_conversation_email
    User.where.not(id: conversation.author.id).each do |user|
      NewConversationNotificationJob.perform_later(@conversation.id, user.id)
    end
  end
end