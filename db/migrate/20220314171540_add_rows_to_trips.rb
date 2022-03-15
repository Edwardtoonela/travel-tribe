class AddRowsToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :name, :string
    add_column :trips, :max_guests, :integer
  end
end
