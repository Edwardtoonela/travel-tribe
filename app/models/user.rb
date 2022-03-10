class User < ApplicationRecord
  has_many :bookmarks
  has_many :bookings
  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { minimum: 3 }
end
