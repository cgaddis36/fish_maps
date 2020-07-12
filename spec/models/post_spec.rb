require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
   it { should validate_presence_of :region }
   it { should validate_presence_of :state }
  end

  describe "relationships" do
    it { should have_many(:fish_posts)}
    it { should have_many(:fish).through(:fish_posts)}
    it { should belong_to(:user)}
  end
end
