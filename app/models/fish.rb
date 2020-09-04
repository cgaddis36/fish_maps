class Fish < ApplicationRecord
  validates :quantity, presence: true
  validates :species, presence: true

  belongs_to :post

  def self.find_photo
    first.photo
  end
end
