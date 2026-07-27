require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /profile" do
    it "shows the current user's profile" do
      user = create(:user)
      sign_in user

      get profile_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.email)
    end
  end
end
