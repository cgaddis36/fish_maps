class Fish < ApplicationRecord
  validates_presence_of :species
  validates_presence_of :quantity

  belongs_to :post

  def self.find_photo
    first.photo
  end
end
