require 'rails_helper'

RSpec.describe 'As a visitor I can login' do
  before(:each) do
    @harry = create(:user, password: 'test password')
  end
  it 'and logout successfully' do
    visit '/'

    within '#default-login' do
      click_on('Log In')
    end

    expect(current_path).to eq('/login')

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: 'test password'
    click_on('Log In')

    expect(page).to have_content("Welcome to FishMaps, #{@harry.name}!")

    expect(current_path).to eq('/')
  end
  it 'login sad path' do
    visit '/'

    within '#default-login' do
      click_on('Log In')
    end

    expect(current_path).to eq('/login')

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: 'ginny123'
    click_on('Log In')

    expect(page).to have_content('Incorrect email/password')

    expect(current_path).to eq('/login')

    fill_in 'Email', with: 'dumbledores_army@example.com'
    fill_in 'Password', with: 'Ginny123'
    click_on('Log In')

    expect(page).to have_content('Incorrect email/password')
  end
end
