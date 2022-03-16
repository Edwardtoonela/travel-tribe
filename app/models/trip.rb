class Trip < ApplicationRecord
  include AlgoliaSearch
  has_many :bookmarks
  has_many :bookings
  has_many :reviews
  has_one_attached :photo
  belongs_to :user

  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :price_max, presence: true
  validates :price_min, presence: true

  def average_rating
    ratings= reviews.map do |review|
      review.rating
    end
    (ratings.sum.to_f / ratings.length).round(2)
  end


  algoliasearch do
    attributes :name, :description, :location
    searchableAttributes ['name', 'description']
  end
  # 'trip.averaga_rating'
  # 'unordered(description)'
  ## Method for average rating -> get all ratings then divide by nr of ratings
end
