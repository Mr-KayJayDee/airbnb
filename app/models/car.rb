class Car < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :brand, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :photo, presence: true
  validates :address, presence: true
end
