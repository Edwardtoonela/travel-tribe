class AddColumnToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :address, :string
  end
end
