class Trip < ApplicationRecord
  include AlgoliaSearch
  has_many :bookmarks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :description, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :price_max, presence: true
  validates :price_min, presence: true

  # geocode (map)
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    ratings = reviews.map do |review|
      review.rating
    end
    if ratings == []
      "No Ratings"
    else
      (ratings.sum.to_f / ratings.length).round(2)
    end
  end

  def ratings_count
    ratings = reviews.map do |review|
      review.rating
    end
    (ratings.length)
  end

  algoliasearch do
    attributes :name, :description, :address
    searchableAttributes ['name', 'description']
  end
  # 'trip.averaga_rating'
  # 'unordered(description)'
  ## Method for average rating -> get all ratings then divide by nr of ratings
end
