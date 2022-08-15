class AddNightsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :nights, :integer
  end
end
