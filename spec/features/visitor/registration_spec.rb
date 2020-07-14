require 'rails_helper'

RSpec.describe 'As a visitor I can register' do
  it 'as a new user and logout successfully' do
    visit '/'

    within '#registration' do
      click_on("Create Profile")
    end

    expect(current_path).to eq('/registration')

    fill_in 'Name', with: 'Harry Potter'
    fill_in 'Email', with: 'gryffindor_galore@example.com'
    fill_in 'Username', with: 'harry36'
    fill_in 'City', with: 'London'
    select 'Texas', from: 'State'
    fill_in 'Password', with: 'hermoine123'
    fill_in 'Password confirmation', with: 'hermoine123'
    click_on("Create Profile")

    expect(User.last.name).to eq("Harry Potter")

    expect(page).to have_content("Welcome, Harry Potter!")

    expect(current_path).to eq('/profile')

    expect(page).to have_content("Harry Potter")
    expect(page).to have_content("Location: London, TX")

    click_on("Logout")

    expect(page).to have_content("Successfully Logged Out")

    expect(current_path).to eq('/')
  end

  it "registration sad path" do
    visit '/'

    within '#registration' do
      click_on("Create Profile")
    end

    expect(current_path).to eq('/registration')

    fill_in 'Name', with: 'Harry Potter'
    fill_in 'Email', with: ''
    fill_in 'Username', with: 'harry36'
    fill_in 'City', with: 'London'
    select 'Texas', from: 'State'
    fill_in 'Password', with: 'hermoine123'
    fill_in 'Password confirmation', with: 'hermoine123'
    click_on("Create Profile")

    expect(page).to have_content("Email can't be blank")
    expect(current_path).to eq('/registration')

    fill_in 'Name', with: 'Harry Potter'
    fill_in 'Email', with: 'gryffindor@example.com'
    fill_in 'Username', with: 'harry36'
    fill_in 'City', with: 'London'
    select 'Texas', from: 'State'
    fill_in 'Password', with: 'hermoine123'
    fill_in 'Password confirmation', with: 'hermoin123'
    click_on("Create Profile")

    expect(page).to have_content("Password confirmation doesn't match")
    expect(current_path).to eq('/registration')
    expect(User.all).to be_empty
  end
end
