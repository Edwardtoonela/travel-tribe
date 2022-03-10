class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
