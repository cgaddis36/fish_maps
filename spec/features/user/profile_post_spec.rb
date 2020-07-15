require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    @harry = User.create(
                          name: Faker::Movies::HarryPotter.character,
                          email: Faker::Movies::HarryPotter.house + '@example.com',
                          password: Faker::Movies::HarryPotter.spell
                        )
  end
  it 'When I visit my profile page I see a list of all of the posts I have made' do
require "pry"; binding.pry

  end
end
