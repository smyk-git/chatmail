class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user = current_user

    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        {
          message_id: @message.id,
          message_html: render_to_string(
            partial: 'messages/message',
            formats: [:html],
            locals: { message: @message }
          ),
        }
      )
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
