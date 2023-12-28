class Rental < ApplicationRecord
  # Associations
  belongs_to :user
  has_many_attached :photos
  # has_many :photos - this may no longer be relavent due to ActiveStorage
  # Validations
  validates :home_type, presence: true
  validates :rental_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
end
