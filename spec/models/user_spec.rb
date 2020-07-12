require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
   it { should validate_presence_of :username }
   it { should validate_presence_of :city }
   it { should validate_presence_of :state }
   it { should validate_presence_of :first_name }
   it { should validate_presence_of :last_name }
  end

  describe "relationships" do
    it { should have_many(:posts)}
  end
end
