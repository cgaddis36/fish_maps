require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'I can create a new post' do
    visit '/post'

    fill_in 'Title', with: '14 inch Brookie'
    fill_in 'Body of water', with: 'Idaho Springs Reservoir'
    fill_in 'City', with: 'Idaho Springs'
    select 'Front Range', from: 'Region'
    select 'Colorado', from: 'State'
    select 'Public', from: 'Privacy'
    select 'Fly', from: 'Fly or conventional'
    click_on('Record New Catch')

    post = Post.last

    expect(post.title).to eq('14 inch Brookie')

    expect(current_path).to eq("/post/#{post.id}")

    expect(page).to have_content(post.title)
  end
end
