require 'rails_helper'

RSpec.describe 'As a visitor I can login' do
  before(:each) do
    @harry = User.create(name: "Harry Potter", email: "slytherins_true_heir@example.com", password: 'Ginny123')
  end
  it 'and logout successfully' do
    visit '/'

    within '#default-login' do
      click_on("Log In")
    end

    expect(current_path).to eq('/login')

    fill_in 'Email', with: @harry.email
    fill_in 'Password', with: 'Ginny123'
    click_on("Log In")

    expect(page).to have_content("Welcome to FishMaps, #{@harry.name}!")

    expect(current_path).to eq('/')
  end
end
