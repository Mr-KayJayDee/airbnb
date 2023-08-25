class Car < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :brand, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :photos, presence: true
  validates :address, presence: true
end
