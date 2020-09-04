require 'rails_helper'

RSpec.describe 'registration sad path' do
  it 'will not registor with incorrect email or password' do
    visit '/'

    within '#registration' do
      click_on('Create Profile')
    end

    expect(current_path).to eq('/registration')

    fill_in 'Name', with: 'Harry Potter'
    fill_in 'Email', with: ''
    fill_in 'City', with: 'London'
    select 'Texas', from: 'State'
    fill_in 'Password', with: 'hermoine123'
    fill_in 'Password confirmation', with: 'hermoine123'
    click_on('Create Profile')

    expect(page).to have_content("Email can't be blank")
    expect(current_path).to eq('/registration')

    fill_in 'Name', with: 'Harry Potter'
    fill_in 'Email', with: 'gryffindor@example.com'
    fill_in 'City', with: 'London'
    select 'Texas', from: 'State'
    fill_in 'Password', with: 'hermoine123'
    fill_in 'Password confirmation', with: 'hermoin123'
    click_on('Create Profile')

    expect(page).to have_content("Password confirmation doesn't match")
    expect(current_path).to eq('/registration')
    expect(User.all).to be_empty
  end
end
