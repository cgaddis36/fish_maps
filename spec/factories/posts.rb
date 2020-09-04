FactoryBot.define do
  factory :post do
    title { Faker::Movies::StarWars.character }
    body_of_water { Faker::Movies::StarWars.specie }
    region { 'South Park' }
    state { Faker::TvShows::GameOfThrones.city }
    privacy { 'Public' }
    fly_or_conventional { 'Fly' }
    association :user, factory: :user
  end
end
