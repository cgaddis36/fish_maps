require 'rails_helper'

RSpec.describe FishPost, type: :model do
  describe "relationships" do
    it { should belong_to(:fish)}
    it { should belong_to(:post)}
  end
end
