require 'rails_helper'

RSpec.describe "As a visitor" do
  it "When I navigate to the homepage I can login with Google Oauth" do
    visit '/'

    expect(page).to have_content("FishMaps")

    expect(page).to have_link("Login with Google")

    within "#about_me" do
      expect(page).to have_content("Report Your Catch for Fishing Conservation Efforts")
    end
  end
end
