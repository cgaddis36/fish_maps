class Fish < ApplicationRecord
  validates_presence_of :species
  validates_presence_of :harvested
  validates_presence_of :quantity

  has_many :fish_posts
  has_many :posts, through: :fish_posts
end
