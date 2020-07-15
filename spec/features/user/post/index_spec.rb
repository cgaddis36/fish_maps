require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    @harry = User.create(
                          name: Faker::Movies::HarryPotter.character,
                          email: Faker::Movies::HarryPotter.house + '@example.com',
                          password: Faker::Movies::HarryPotter.spell,
                          city: Faker::Movies::HarryPotter.location,
                          state: Faker::Movies::HarryPotter.location
                        )
    @post = @harry.posts.create(
                        title: Faker::Movies::StarWars.vehicle,
                        body_of_water: Faker::Movies::StarWars.specie,
                        region: Faker::Movies::StarWars.planet,
                        state: Faker::TvShows::GameOfThrones.city,
                        privacy: 'Public',
                        fly_or_conventional: "Fly"
                        )

    @hermoine = User.create(
                          name: Faker::Movies::HarryPotter.character,
                          email: Faker::Movies::HarryPotter.house + '@example.com',
                          password: Faker::Movies::HarryPotter.spell,
                          city: Faker::Movies::HarryPotter.location,
                          state: Faker::Movies::HarryPotter.location
                        )

    @post1 = @harry.posts.create(
                        title: Faker::Movies::StarWars.vehicle,
                        body_of_water: Faker::Movies::StarWars.specie,
                        region: Faker::Movies::StarWars.planet,
                        state: Faker::TvShows::GameOfThrones.city,
                        privacy: 'Public',
                        fly_or_conventional: "Fly"
                        )
    @fish = @post1.fish.create(
              species: Faker::Movies::StarWars.specie,
              length: 30,
              weight: 12,
              quantity: 2,
              harvested: true,
              photo: 'https://www.hakaimagazine.com/wp-content/uploads/header-fish-feel.jpg'
              )
    @post2 = @harry.posts.create(
                        title: Faker::Movies::StarWars.vehicle,
                        body_of_water: Faker::Movies::StarWars.specie,
                        region: Faker::Movies::StarWars.planet,
                        state: Faker::TvShows::GameOfThrones.city,
                        privacy: 'Public',
                        fly_or_conventional: "Fly"
                        )

     @post3 = @hermoine.posts.create(
                        title: Faker::Movies::StarWars.vehicle,
                        body_of_water: Faker::Movies::StarWars.specie,
                        region: Faker::Movies::StarWars.planet,
                        state: Faker::TvShows::GameOfThrones.city,
                        privacy: 'Public',
                        fly_or_conventional: "Fly"
                        )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@harry)
  end
  it 'When I visit my profile page I see a list of all of the posts I have made' do
    visit '/profile'

    expect(page).to have_css('#post', count: 3)
  end
  it "When I visit the homePage i see all of the posts in descending chronological order with newest posts coming first" do
    visit '/'

    expect(page).to have_css('.card-columns', count: 4)

    within first('.card-columns') do
      expect(page).to have_content(@post3.title)
    end

    within all('.card-columns').last do
      expect(page).to have_content(@post.title)
    end
  end
end
