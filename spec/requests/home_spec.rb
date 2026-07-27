require "rails_helper"

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "redirects a guest to the sign-in page" do
      get root_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "redirects a signed-in user to their profile" do
      sign_in create(:user)
      get root_path
      expect(response).to redirect_to(profile_path)
    end
  end
end
