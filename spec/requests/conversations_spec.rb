require "rails_helper"

RSpec.describe "Conversations", type: :request do
  let(:user) { create(:user) }

  describe "GET /conversations" do
    it "redirects a guest to the sign-in page" do
      get conversations_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "lists conversations for a signed-in user" do
      sign_in user
      create(:conversation, subject: "Team sync")

      get conversations_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Team sync")
    end
  end

  describe "GET /conversations/:id" do
    it "shows the conversation" do
      sign_in user
      conversation = create(:conversation, subject: "Design chat")

      get conversation_path(conversation)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("DESIGN CHAT")
    end
  end

  describe "POST /conversations" do
    it "creates a conversation and redirects to it" do
      sign_in user

      expect do
        post conversations_path, params: { conversation: { subject: "New topic" } }
      end.to change(Conversation, :count).by(1)

      expect(response).to redirect_to(Conversation.last)
    end
  end

  describe "DELETE /conversations/:id" do
    it "destroys the conversation" do
      sign_in user
      conversation = create(:conversation)

      expect do
        delete conversation_path(conversation)
      end.to change(Conversation, :count).by(-1)

      expect(response).to redirect_to(conversations_path)
    end
  end
end
