class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = current_user.conversations.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to @conversation, notice: "Your message has been sent!"
    else
      @messages = @conversation.messages.includes(:user).order(created_at: :desc)
      render "conversations/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
