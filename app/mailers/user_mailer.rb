class UserMailer < ApplicationMailer
  default from: "no-reply@chatmail.test"
  def new_conversation_notification(conversation, user)
    @conversation = conversation
    @user = user
    mail(
      to: @user.email,
      subject: "Dostępna jest nowa konwersacja o tytule #{@conversation.subject}"
    )
  end
end
