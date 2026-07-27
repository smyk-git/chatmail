require "rails_helper"

RSpec.describe MessageAnalysisJob, type: :job do
  let(:message) { create(:message) }

  it "stores the analyzer result on the message" do
    result = { "sentiment" => "positive", "flagged" => false, "tags" => ["greeting"] }
    allow(MessageAnalysisService).to receive(:analyze).and_return(result)

    described_class.perform_now(message.id)

    expect(message.reload.analysis).to eq(result)
  end

  it "leaves the message untouched when analysis returns nil" do
    allow(MessageAnalysisService).to receive(:analyze).and_return(nil)

    expect { described_class.perform_now(message.id) }
      .not_to(change { message.reload.analysis })
  end
end
