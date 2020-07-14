require 'rails_helper'

RSpec.describe "As a visitor" do
  before(:each) do
    @harry = User.create(name: "Harry Potter", email: "slytherins_tru_heir@example.com", password: "Ginny333")
  end
  it "I can login successfully" do
    visit '/'

    click_on("Login")

    expect(current_path).to eq('/login')

    fill_in "Email", with: @harry.email
    fill_in "Password", with: "Ginny333"
    click_on("Login")

    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome to FishMaps, #{@harry.name}!")
  end
end
