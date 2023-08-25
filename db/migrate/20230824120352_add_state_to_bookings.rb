class AddStateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :state, :string, default: "pending"
  end
end
