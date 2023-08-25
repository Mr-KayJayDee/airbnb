class AddRatingToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :rating, :integer
  end
end
