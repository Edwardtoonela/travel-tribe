class User < ApplicationRecord
  after_create :send_welcome_email
  has_many :trips
  has_many :bookmarks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :user_name, presence: true, length: { minimum: 3 }

  private

  def send_join_email
    UserMailer.with(user: self).join.deliver_now
  end
end
