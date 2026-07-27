require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /profile" do
    it "redirects a guest to the sign-in page" do
      get profile_path

      expect(response).to redirect_to(new_user_session_path)
    end

    it "shows the current user's profile when signed in" do
      user = create(:user)
      sign_in user

      get profile_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.email)
    end
  end
end
