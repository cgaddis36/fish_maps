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
      harry = create(:user)
      
      post = create(:post, user: harry)
      post1 = create(:post, user: harry)
      post2 = create(:post, region: 'Front Range', user: harry)

      expect(harry.new_posts.first.id).to eq(post2.id)
      expect(harry.new_posts.last.id).to eq(post.id)
    end
  end
end
