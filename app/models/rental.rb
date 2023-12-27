class Rental < ApplicationRecord
  belongs_to :user
  validates :home_type, presence: true
  validates :rental_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
end
