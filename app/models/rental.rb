class Rental < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :photos
  # Validations
  validates :home_type, presence: true
  validates :rental_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
end
