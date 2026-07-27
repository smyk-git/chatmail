require "rails_helper"

RSpec.describe Conversation, type: :model do
  it "has a valid factory" do
    expect(build(:conversation)).to be_valid
  end

  describe "validations" do
    it "requires a subject" do
      conversation = build(:conversation, subject: nil)
      expect(conversation).not_to be_valid
      expect(conversation.errors[:subject]).to be_present
    end

    it "rejects a subject longer than 255 characters" do
      expect(build(:conversation, subject: "a" * 256)).not_to be_valid
    end
  end

  describe "associations" do
    it "has many participants through conversation_users" do
      conversation = create(:conversation)
      user = create(:user)
      conversation.users << user
      expect(conversation.users).to include(user)
    end

    it "destroys its messages when destroyed" do
      message = create(:message)
      conversation = message.conversation
      expect { conversation.destroy }.to change(Message, :count).by(-1)
    end
  end

  describe "#author" do
    it "returns the user stored in user_id" do
      author = create(:user)
      conversation = create(:conversation, author: author)
      expect(conversation.author).to eq(author)
    end
  end
end
