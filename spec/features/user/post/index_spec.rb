require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    @harry = create(:user)
    @hermoine = create(:user)

    @post = create(:post, user: @harry)
    @post1 = create(:post, user: @harry)
    @post2 = create(:post, region: 'Front Range', user: @harry)
    @post3 = create(:post, user: @hermoine)

    @fish = create(:fish, post: @post1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@harry)
  end
  it 'When I visit my profile page I see a list of all of the posts I have made' do
    visit '/profile'

    expect(page).to have_css('#post', count: 3)
  end
  it 'When I visit the homePage i see all of the posts in descending
  chronological order with newest posts coming first' do
    visit '/'

    expect(page).to have_css('.card-columns', count: 4)

    within first('.card-columns') do
      expect(page).to have_content(@post3.title)
    end

    within all('.card-columns').last do
      expect(page).to have_content(@post.title)
    end
  end
  it 'can filter posts based on region' do
    visit '/'

    select 'Front Range', from: 'Region'

    click_on('Filter By Region')

    expect(page).to have_content(@post2.title)
    expect(page).to_not have_content(@post.title)
    expect(page).to_not have_content(@post1.title)
    expect(page).to_not have_content(@post3.title)

    select 'South Park', from: 'Region'
    click_on('Filter By Region')

    expect(page).to_not have_content(@post2.title)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post3.title)
  end
end
