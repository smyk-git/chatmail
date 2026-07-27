require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "#new_conversation_notification" do
    let(:user) { create(:user) }
    let(:conversation) { create(:conversation) }
    let(:mail) { described_class.new_conversation_notification(conversation, user) }

    it "is addressed to the given user" do
      expect(mail.to).to eq([ user.email ])
    end

    it "comes from the application address" do
      expect(mail.from).to eq([ "no-reply@chatmail.test" ])
    end

    it "puts the conversation subject in the email subject" do
      expect(mail.subject).to include(conversation.subject)
    end

    it "mentions the conversation in the body" do
      expect(mail.body.encoded).to include(conversation.subject)
    end
  end
end
