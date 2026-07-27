require "rails_helper"

RSpec.describe Message, type: :model do
  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end

  describe "validations" do
    it "requires a body" do
      message = build(:message, body: nil)
      expect(message).not_to be_valid
      expect(message.errors[:body]).to be_present
    end

    it "is invalid without a user" do
      expect(build(:message, user: nil)).not_to be_valid
    end

    it "is invalid without a conversation" do
      expect(build(:message, conversation: nil)).not_to be_valid
    end
  end

  describe "associations" do
    it "belongs to a user and a conversation" do
      message = create(:message)
      expect(message.user).to be_present
      expect(message.conversation).to be_present
    end
  end

  describe "#author" do
    it "returns the message user" do
      message = create(:message)
      expect(message.author).to eq(message.user)
    end
  end

  describe "DISPLAY_COUNT" do
    it "caps how many recent messages the view shows" do
      expect(Message::DISPLAY_COUNT).to eq(4)
    end
  end

  describe "after_create" do
    it "enqueues a MessageAnalysisJob" do
      expect { create(:message) }.to have_enqueued_job(MessageAnalysisJob)
    end
  end
end
