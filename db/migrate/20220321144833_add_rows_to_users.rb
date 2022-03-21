class AddRowsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :traveltype, :text
    add_column :users, :home, :string
    add_column :users, :languages, :string
  end
end
