require "rails_helper"

RSpec.describe User do
  subject(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end
end
