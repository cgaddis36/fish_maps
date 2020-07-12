class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :posts
end
