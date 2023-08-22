class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :photo, presence: true
end
