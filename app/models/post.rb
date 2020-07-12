class Post < ApplicationRecord
  validates_presence_of :state

  enum privacy: %i[open closed]
  enum fly_or_conventional: %i[fly conventional]

  belongs_to :user

  has_many :fish
end
