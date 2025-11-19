# Preview all emails at http://localhost:3000/rails/mailers/user_mailer_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_conversation_notification
    UserMailer.new_conversation_notification(Conversation.last, User.last)
  end
end
