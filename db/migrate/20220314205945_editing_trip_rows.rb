class EditingTripRows < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :price_min, :integer
    add_column :trips, :price_max, :integer
    remove_column :reviews, :date
  end
end
