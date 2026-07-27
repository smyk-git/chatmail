require "rails_helper"

RSpec.describe "Messages", type: :request do
  let(:user) { create(:user) }
  let(:conversation) { create(:conversation) }

  describe "POST /conversations/:conversation_id/messages" do
    it "redirects a guest to the sign-in page" do
      post conversation_messages_path(conversation), params: { message: { body: "Hi" } }

      expect(response).to redirect_to(new_user_session_path)
    end

    context "when signed in" do
      before { sign_in user }

      it "creates a message and redirects to the conversation" do
        expect do
          post conversation_messages_path(conversation), params: { message: { body: "Hello there" } }
        end.to change(conversation.messages, :count).by(1)

        expect(response).to redirect_to(conversation)
      end

      it "assigns the message to the current user" do
        post conversation_messages_path(conversation), params: { message: { body: "Mine" } }

        expect(conversation.messages.last.user).to eq(user)
      end

      it "rejects a blank body and re-renders the conversation" do
        expect do
          post conversation_messages_path(conversation), params: { message: { body: "" } }
        end.not_to change(Message, :count)

        expect(response).to have_http_status(422)
      end

      it "broadcasts the new message over ActionCable" do
        expect do
          post conversation_messages_path(conversation), params: { message: { body: "Broadcast me" } }
        end.to have_broadcasted_to(conversation).from_channel(ConversationChannel)
      end
    end
  end
end
