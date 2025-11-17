class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.conversations.order(created_at: :desc)
  end

  def show
    @conversation = current_user.conversations.find(params[:id])
    @messages = @conversation.messages.order(created_at: :asc)
    @message = @conversation.messages.build
  end

  def new
    @conversation = current_user.conversations.build
  end

  def create
    @conversation = current_user.conversations.build(conversation_params)
    if @conversation.save
      redirect_to @conversation, notice: "Your conversation has been created!"
    else
      render :new, status: :unprocessable_entity, alert: "Your conversation failed to be created!"
    end
  end

  def destroy
    @conversation = current_user.conversations.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path, notice: "Rozmowa została usunięta."
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject)
  end

end
