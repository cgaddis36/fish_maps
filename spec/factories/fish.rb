FactoryBot.define do
  factory :fish do
    species { Faker::Movies::StarWars.specie }
    length { 30 }
    weight { 12 }
    quantity { 2 }
    harvested { true }
    photo { 'https://www.hakaimagazine.com/wp-content/uploads/header-fish-feel.jpg' }
    association :post, factory: :post
  end
end
