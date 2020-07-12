class Fish < ApplicationRecord
  validates_presence_of :species
  validates_presence_of :quantity

  belongs_to :post
end
