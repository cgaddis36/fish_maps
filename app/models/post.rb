class Post < ApplicationRecord
  validates_presence_of :state
  validates_presence_of :region

  belongs_to :user

  has_many :fish
end
