require "rails_helper"

RSpec.describe ConversationChannel, type: :channel do
  it "confirms the subscription and streams for the conversation" do
    conversation = create(:conversation)
    stub_connection

    subscribe(id: conversation.id)

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_for(conversation)
  end

  it "raises when the conversation does not exist" do
    stub_connection

    expect { subscribe(id: -1) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
