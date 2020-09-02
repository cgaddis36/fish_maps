FactoryBot.define do
  factory :user do
    name { Faker::Movies::HarryPotter.character }
    email { Faker::Movies::HarryPotter.house + '@example.com' }
    password { Faker::Movies::HarryPotter.spell }
    city { Faker::Movies::HarryPotter.location }
    state { Faker::Movies::HarryPotter.location }
  end
end
