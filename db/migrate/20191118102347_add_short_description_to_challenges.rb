class AddShortDescriptionToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :short_description, :string
  end
end
