class Post < ApplicationRecord
  validates_presence_of :state

  belongs_to :user

  has_many :fish
end
