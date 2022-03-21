class ChangeTripDescriptionFromStringToText < ActiveRecord::Migration[6.1]
  def change
    change_column :trips, :description, :text
  end
end
