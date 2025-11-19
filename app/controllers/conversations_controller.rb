class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.order(created_at: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.users << current_user unless @conversation.users.exists?(current_user.id)
    @messages = @conversation.messages.includes(:user).order(created_at: :desc)
    @message = @conversation.messages.build
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.create!(conversation_params.merge(user_id: current_user.id))
    @conversation.users << current_user #unless @conversation.users.exists?(current_user.id)
    if @conversation.save
      UserEmailService.new(@conversation).send_conversation_email
      redirect_to @conversation, notice: "Your conversation has been created!"
    else
      render :new, status: :unprocessable_entity, alert: "Your conversation failed to be created!"
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path, notice: "Rozmowa została usunięta."
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject)
  end

end
