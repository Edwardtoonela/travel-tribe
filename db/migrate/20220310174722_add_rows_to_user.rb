class AddRowsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :user_name, :string
    add_column :users, :tags, :string
  end
end
