require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
   it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many(:posts)}
  end

  describe "instance methods" do
    it '.new_posts' do
      harry = User.create(
                            name: Faker::Movies::HarryPotter.character,
                            email: Faker::Movies::HarryPotter.house + '@example.com',
                            password: Faker::Movies::HarryPotter.spell,
                            city: Faker::Movies::HarryPotter.location,
                            state: Faker::Movies::HarryPotter.location
                          )
      post = harry.posts.create(
                          title: Faker::Movies::StarWars.vehicle,
                          body_of_water: Faker::Movies::StarWars.specie,
                          region: Faker::Movies::StarWars.planet,
                          state: Faker::TvShows::GameOfThrones.city,
                          privacy: 'Public',
                          fly_or_conventional: "Fly"
                          )

      hermoine = User.create(
                            name: Faker::Movies::HarryPotter.character,
                            email: Faker::Movies::HarryPotter.house + '@example.com',
                            password: Faker::Movies::HarryPotter.spell,
                            city: Faker::Movies::HarryPotter.location,
                            state: Faker::Movies::HarryPotter.location
                          )

      post1 = harry.posts.create(
                          title: Faker::Movies::StarWars.vehicle,
                          body_of_water: Faker::Movies::StarWars.specie,
                          region: Faker::Movies::StarWars.planet,
                          state: Faker::TvShows::GameOfThrones.city,
                          privacy: 'Public',
                          fly_or_conventional: "Fly"
                          )
      fish = post1.fish.create(
                species: Faker::Movies::StarWars.specie,
                length: 30,
                weight: 12,
                quantity: 2,
                harvested: true,
                photo: 'https://www.hakaimagazine.com/wp-content/uploads/header-fish-feel.jpg'
                )
      post2 = harry.posts.create(
                          title: Faker::Movies::StarWars.vehicle,
                          body_of_water: Faker::Movies::StarWars.specie,
                          region: Faker::Movies::StarWars.planet,
                          state: Faker::TvShows::GameOfThrones.city,
                          privacy: 'Public',
                          fly_or_conventional: "Fly"
                          )

       post3 = hermoine.posts.create(
                          title: Faker::Movies::StarWars.vehicle,
                          body_of_water: Faker::Movies::StarWars.specie,
                          region: Faker::Movies::StarWars.planet,
                          state: Faker::TvShows::GameOfThrones.city,
                          privacy: 'Public',
                          fly_or_conventional: "Fly"
                          )

      expect(harry.new_posts.first.id).to eq(post2.id)
      expect(harry.new_posts.last.id).to eq(post.id)


    end
  end
end
