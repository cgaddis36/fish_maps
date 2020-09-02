class Post < ApplicationRecord
  validates :state, presence: true

  belongs_to :user, dependent: :destroy

  has_many :fish, dependent: :destroy

  def self.order_posts
    order(id: :desc)
  end

  def self.order_by_region(region)
    where(region: region)
  end
end
