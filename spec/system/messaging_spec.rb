require "rails_helper"

RSpec.describe "Messaging", type: :system do
  it "lets a visitor register, start a conversation and send a message" do
    visit new_user_registration_path

    fill_in "user_name", with: "Grace Hopper"
    fill_in "user_email", with: "grace@example.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Załóż konto"

    # Devise signs the new user in and root redirects to their profile.
    expect(page).to have_content("Grace Hopper")

    visit conversations_path
    click_link "Nowa rozmowa"
    fill_in "conversation_subject", with: "Launch plan"
    click_button "Utwórz"

    expect(page).to have_content("LAUNCH PLAN")

    fill_in "message_body", with: "Hello team, first message!"
    click_button "Wyślij"

    expect(page).to have_content("Hello team, first message!")
  end
end
