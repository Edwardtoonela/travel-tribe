class Trip < ApplicationRecord
  has_many :bookmarks
  has_many :bookings
  has_many :reviews

  validates :description, presence: true
  validates :location, presence: true
end
