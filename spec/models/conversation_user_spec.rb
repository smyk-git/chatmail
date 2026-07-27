require "rails_helper"

RSpec.describe ConversationUser, type: :model do
  it "has a valid factory" do
    expect(build(:conversation_user)).to be_valid
  end

  it "belongs to a conversation and a user" do
    conversation_user = create(:conversation_user)
    expect(conversation_user.conversation).to be_present
    expect(conversation_user.user).to be_present
  end
end
