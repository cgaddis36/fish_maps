require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe "validations" do
   it { should validate_presence_of :species }
   it { should validate_presence_of :quantity }
  end

  describe "relationships" do
    it { should belong_to(:post) }
  end
end
