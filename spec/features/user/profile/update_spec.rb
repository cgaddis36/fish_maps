require 'rails_helper'

RSpec.describe 'As a registered User' do
  before(:each) do
    @harry = User.create(
                          name: Faker::Movies::HarryPotter.character,
                          email: Faker::Movies::HarryPotter.house + '@example.com',
                          password: Faker::Movies::HarryPotter.spell,
                          city: Faker::Movies::HarryPotter.location,
                          state: Faker::Movies::HarryPotter.location
                        )
  end
  it "I can update my profile credentials" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@harry)
    visit '/profile'

    click_on("Update Profile")

    fill_in "Name", with: "Garfield"
    fill_in "Email", with: "terrific_lasagna@example.com"
    fill_in "City", with: "Paris"
    select "Texas", from: "State"
    click_on("Update Profile")

    expect(current_path).to eq("/profile")

    expect(page).to have_content("Profile Successfully Updated!")
    expect(page).to have_content("Garfield")
    expect(page).to have_content("Location: Paris, TX")
  end
  it 'I can also update my password' do
    visit '/'

    within '#default-login' do
      click_on("Log In")
    end

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: @harry.password
    click_on("Log In")

    expect(current_path).to eq('/')

    visit '/profile'

    click_on 'Forgot Password?'

    expect(current_path).to eq('/password')

    fill_in 'Password', with: 'hagrid123'
    fill_in 'Password confirmation', with: 'hagrid123'
    click_on("Generate New Password")

    expect(current_path).to eq('/profile')

    expect(page).to have_content("Password Successfully Updated!")

    click_on("Logout")

    visit '/'

    within '#default-login' do
      click_on("Log In")
    end

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: 'hagrid123'
    click_on("Log In")

    expect(page).to have_content("Welcome to FishMaps, #{@harry.name}!")
  end
  it 'can not update without matching passwords' do
    visit '/'

    within '#default-login' do
      click_on("Log In")
    end

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: @harry.password
    click_on("Log In")

    expect(current_path).to eq('/')

    visit '/profile'

    click_on 'Forgot Password?'

    expect(current_path).to eq('/password')

    fill_in 'Password', with: 'hagrid123'
    fill_in 'Password confirmation', with: 'hermoinestinks'
    click_on("Generate New Password")

    expect(current_path).to eq('/password')

    expect(page).to have_content("Passwords do not match, try another combination.")
  end
end
