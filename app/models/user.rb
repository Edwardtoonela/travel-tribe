class User < ApplicationRecord
  has_many :bookmarks
  has_many :bookings
  has_many :reviews
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :user_name, presence: true, length: { minimum: 3 }
end
