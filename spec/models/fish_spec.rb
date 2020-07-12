require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe "validations" do
   it { should validate_presence_of :species }
   it { should validate_presence_of :harvested }
  end

  describe "relationships" do
    it { should have_many(:fish_posts) }
    it { should have_many(:posts).through(:fish_posts) }
  end
end
