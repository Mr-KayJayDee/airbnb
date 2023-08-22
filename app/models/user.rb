class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates devise first_name and last_name
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :cars, dependent: :destroy
  has_many :rented_bookings, through: :cars, class_name: 'Booking', source: :bookings
  has_many :bookings, dependent: :destroy
end
