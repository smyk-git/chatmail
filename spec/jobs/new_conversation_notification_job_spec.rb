require "rails_helper"

RSpec.describe NewConversationNotificationJob, type: :job do
  it "delivers the new conversation notification email" do
    conversation = create(:conversation)
    user = create(:user)

    expect { described_class.perform_now(conversation.id, user.id) }
      .to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
  end
end
