class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :xp, :integer, default: 0
    add_column :users, :level, :integer, default: 0
    add_column :users, :gender, :integer, default: 0
    add_column :users, :address, :string
    add_column :users, :tree_count, :integer, default: 0
  end
end
