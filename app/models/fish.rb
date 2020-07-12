class Fish < ApplicationRecord
  validates_presence_of :quantity
  validates_presence_of :species

  belongs_to :post

  def self.find_photo
    first.photo
  end
end
